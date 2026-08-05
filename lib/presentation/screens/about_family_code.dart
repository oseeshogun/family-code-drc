import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutFamilyCode extends HookConsumerWidget {
  const AboutFamilyCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos du Code de la Famille'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const Text('CODE DE LA FAMILLE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 4),
            const Text('République Démocratique du Congo', style: TextStyle(fontStyle: FontStyle.italic)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            const _InfoSection(
              title: 'Loi n° 87-010 du 1er août 1987',
              lines: [
                'Intitulé : Loi portant Code de la famille',
                'Promulguée le 1er août 1987 — J.O.Z., numéro spécial, août 1987',
                'Entrée en vigueur le 1er août 1988 (douze mois après promulgation, art. 935)',
              ],
            ),
            const SizedBox(height: 16),
            const _InfoSection(
              title: 'Loi n° 16/008 du 15 juillet 2016',
              lines: [
                'Intitulé : Loi modifiant et complétant la Loi n° 87-010 du 1er août 1987 portant Code de la famille',
                'Promulguée et entrée en vigueur le 15 juillet 2016 — J.O.RDC, numéro spécial, 15 juillet 2016',
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            const Text('SOURCE DOCUMENTAIRE', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Le texte proposé dans cette application provient d\'une compilation privée (CDF_2017.pdf, 144 pages, éditée le 25 février 2018), non officielle. Son éditeur décline toute responsabilité quant à son contenu.',
            ),
            const SizedBox(height: 8),
            const Text(
              'La loi de 2016 signale les articles abrogés depuis 1987, mais ne détaille pas les modifications apportées aux articles restés en vigueur : leur texte peut donc dater de 1987 ou avoir été révisé en 2016 sans que la source permette de trancher.',
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            const Text('CLAUSE DE NON-RESPONSABILITÉ', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Cette application n\'est pas une application officielle du gouvernement. Elle ne représente aucun gouvernement, ministère ou institution publique et n\'est affiliée à aucune entité gouvernementale. Pour toute interprétation officielle ou pour des conseils juridiques spécifiques, il est recommandé de consulter les autorités compétentes ou un professionnel du droit qualifié.',
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<String> lines;

  const _InfoSection({required this.title, required this.lines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        ...lines.map((line) => Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text(line))),
      ],
    );
  }
}
