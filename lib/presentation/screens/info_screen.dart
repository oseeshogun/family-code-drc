import 'package:family_code/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:share_plus/share_plus.dart';

class InfoScreen extends HookConsumerWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const packageName = 'com.oseemasuaku.family_code';
    final androidUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    return Scaffold(
      appBar: AppBar(title: const Text('Informations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Code Source'),
              leading: const Icon(Icons.code),
              onTap: () async {
                final urlString = 'https://github.com/oseeshogun/family-code-drc';
                if (await canLaunchUrlString(urlString)) {
                  await launchUrlString(urlString);
                }
              },
            ),
            ListTile(
              title: const Text('Développeur'),
              leading: const Icon(Icons.waving_hand),
              onTap: () async {
                final urlString = 'https://oseemasuaku.com';
                if (await canLaunchUrlString(urlString)) {
                  await launchUrlString(urlString);
                }
              },
            ),
            ListTile(
              title: const Text('Partager l\'application'),
              leading: const Icon(Icons.storefront_outlined),
              trailing: const Icon(Icons.share),
              onTap: () {
                final box = context.findRenderObject() as RenderBox?;
                SharePlus.instance.share(
                  ShareParams(
                    text: 'Découvrez l\'application : $androidUrl',
                    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('À propos du Code de la Famille'),
              leading: const Icon(Icons.corporate_fare),
              onTap: () => AboutRoute().push(context),
            ),
            ListTile(
              title: const Text('Nos autres applications'),
              leading: const Icon(Icons.apps),
              onTap: () async {
                final urlString = 'https://play.google.com/store/apps/dev?id=5877739770389993725';
                if (await canLaunchUrlString(urlString)) {
                  await launchUrlString(urlString);
                }
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Source d\'information :', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'Cette application met à disposition une version numérique du Code de la famille de la République Démocratique du Congo (Loi n° 87-010 du 1er août 1987, modifiée et complétée par la Loi n° 16/008 du 15 juillet 2016), extraite d\'une compilation privée disponible en ligne (CDF_2017.pdf).',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'La République Démocratique du Congo demeurant un pays encore en développement et peu digitalisé, les textes juridiques officiels, y compris le Code de la famille, sont principalement disponibles sous forme papier, accessibles physiquement auprès des institutions et services concernés. À ce jour, aucune plateforme gouvernementale officielle ne propose une version numérique complète et librement accessible du Code de la famille.',
                  ),
                  const SizedBox(height: 20),
                  const Text('CLAUSE DE NON-RESPONSABILITÉ', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'Cette application n\'est PAS une application officielle du gouvernement. Elle ne représente aucun gouvernement, ministère ou institution publique et n\'est affiliée à aucune entité gouvernementale.',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Les informations fournies dans cette application sont proposées à titre informatif et éducatif uniquement. Elles ne constituent pas des conseils juridiques. Bien que nous nous efforcions de fournir un contenu fidèle au texte disponible, aucune garantie n\'est donnée quant à l\'exactitude, l\'exhaustivité ou l\'actualité des informations.',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pour toute interprétation officielle ou pour des conseils juridiques spécifiques, il est recommandé de consulter les autorités compétentes ou un professionnel du droit qualifié.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
