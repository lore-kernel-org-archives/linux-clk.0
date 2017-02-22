Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 22 Feb 2017 14:54:41 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2 mixers and
 display engines
Message-ID: <20170222225441.s7xnv6hvavwbsqma@lukather>
References: <20170222152310.3719-5-icenowy@aosc.xyz>
 <20170222200947.3ikrhvv76ymfu5tv@lukather>
 <3557471487795322@web2j.yandex.ru>
MIME-Version: 1.0
In-Reply-To: <3557471487795322@web2j.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Francois Moine <moinejf@free.fr>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============3044964557449109936=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3044964557449109936==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="diwan3xcga67crqd"
Content-Disposition: inline


--diwan3xcga67crqd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Icenowy,

(Please fix your mailer, its quotation is broken and mangles all the
indentation)

On Thu, Feb 23, 2017 at 04:28:42AM +0800, Icenowy Zheng wrote:
> >> =A0@@ -187,3 +220,30 @@ struct sun4i_layer **sun4i_layers_init(struct =
drm_device *drm)
> >>
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return layers;
> >> =A0=A0}
> >> =A0+
> >> =A0+struct sun4i_layer **sun8i_layers_init(struct drm_device *drm)
> >
> > And store this (and sun4i_layers_init) in an structure holding the
> > function pointers for those.
>=20
> How should I do it?
> If I create a ops struct, where should I reference it?

I'm not sure I get your question. You can create that structure, fill
a field in the sun4i_drv structure at bind time, and call those
function pointers directly where you need to.

> >> =A0+{
> >> =A0+ struct sun4i_layer **layers;
> >> =A0+ int i;
> >> =A0+
> >> =A0+ layers =3D devm_kcalloc(drm->dev, ARRAY_SIZE(sun8i_mixer_planes),
> >> =A0+ sizeof(**layers), GFP_KERNEL);
> >> =A0+ if (!layers)
> >> =A0+ return ERR_PTR(-ENOMEM);
> >> =A0+
> >> =A0+ for (i =3D 0; i < ARRAY_SIZE(sun8i_mixer_planes); i++) {
> >> =A0+ const struct sun4i_plane_desc *plane =3D &sun8i_mixer_planes[i];
> >> =A0+ struct sun4i_layer *layer =3D layers[i];
> >> =A0+
> >> =A0+ layer =3D sun4i_layer_init_one(drm, plane);
> >> =A0+ if (IS_ERR(layer)) {
> >> =A0+ dev_err(drm->dev, "Couldn't initialize %s plane\n",
> >> =A0+ i ? "overlay" : "primary");
> >> =A0+ return ERR_CAST(layer);
> >> =A0+ };
> >> =A0+
> >> =A0+ layer->id =3D i;
> >> =A0+ };
> >> =A0+
> >> =A0+ return layers;
> >> =A0+}
> >> =A0diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.h b/drivers/gpu/drm/=
sun4i/sun4i_layer.h
> >> =A0index a2f65d7a3f4e..f7b9e5daea50 100644
> >> =A0--- a/drivers/gpu/drm/sun4i/sun4i_layer.h
> >> =A0+++ b/drivers/gpu/drm/sun4i/sun4i_layer.h
> >> =A0@@ -26,5 +26,6 @@ plane_to_sun4i_layer(struct drm_plane *plane)
> >> =A0=A0}
> >>
> >> =A0=A0struct sun4i_layer **sun4i_layers_init(struct drm_device *drm);
> >> =A0+struct sun4i_layer **sun8i_layers_init(struct drm_device *drm);
> >>
> >> =A0=A0#endif /* _SUN4I_LAYER_H_ */
> >> =A0diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/=
sun4i/sun8i_mixer.c
> >> =A0new file mode 100644
> >> =A0index 000000000000..9427b57240d3
> >> =A0--- /dev/null
> >> =A0+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >> =A0@@ -0,0 +1,417 @@
> >> =A0+/*
> >> =A0+ * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.xyz>
> >> =A0+ *
> >> =A0+ * Based on sun4i_backend.c, which is:
> >> =A0+ * Copyright (C) 2015 Free Electrons
> >> =A0+ * Copyright (C) 2015 NextThing Co
> >> =A0+ *
> >> =A0+ * This program is free software; you can redistribute it and/or
> >> =A0+ * modify it under the terms of the GNU General Public License as
> >> =A0+ * published by the Free Software Foundation; either version 2 of
> >> =A0+ * the License, or (at your option) any later version.
> >> =A0+ */
> >> =A0+
> >> =A0+#include <drm/drmP.h>
> >> =A0+#include <drm/drm_atomic_helper.h>
> >> =A0+#include <drm/drm_crtc.h>
> >> =A0+#include <drm/drm_crtc_helper.h>
> >> =A0+#include <drm/drm_fb_cma_helper.h>
> >> =A0+#include <drm/drm_gem_cma_helper.h>
> >> =A0+#include <drm/drm_plane_helper.h>
> >> =A0+
> >> =A0+#include <linux/component.h>
> >> =A0+#include <linux/reset.h>
> >> =A0+#include <linux/of_device.h>
> >> =A0+
> >> =A0+#include "sun8i_mixer.h"
> >> =A0+#include "sun4i_drv.h"
> >> =A0+
> >> =A0+#define SUN8I_DRAM_OFFSET 0x40000000
> >
> > PHYS_OFFSET?
>=20
> Any name is OK.

What I meant is that there is already a variable holding that value
that is PHYS_OFFSET.

> (P.S. this seems also needed for some DE1s)

Did you encounter any issue on it?

> >> =A0+#if defined CONFIG_DRM_SUN4I_DE2
> >
> > That ifdef should be in the header
>=20
> So the file only compile if this option is enabled?

Yes.

> And if this option is disabled, inlined null stubs should be
> made in header?

Yes.

> >> =A0+void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
> >> =A0+ int layer, bool enable)
> >> =A0+{
> >> =A0+ u32 val;
> >> =A0+ /* Currently the first UI channel is used */
> >> =A0+ int chan =3D mixer->cfg->vi_num;
> >> =A0+
> >> =A0+ DRM_DEBUG_DRIVER("Enabling layer %d in channel %d\n", layer, chan=
);
> >> =A0+
> >> =A0+ if (enable)
> >> =A0+ val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
> >> =A0+ else
> >> =A0+ val =3D 0;
> >
> > So you only support the UI channel?
> >
> > Why do you expose several planes then?
>=20
> Currently I didn't find any way to enable more than one channel
> at the same time, so only the first UI channel is used.
>=20
> After more knowledges are gained for DE2 mixers we can implement
> more functions (for example, Jernejsk have already discovered how
> to do color space correlation in DE2 for TVE).

Then please expose only the primary plane. You also expose an overlay
here that is not functional from what you tell me.

> >> =A0+ regmap_update_bits(mixer->regs,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> >> =A0+
> >> =A0+ /* Set the alpha configuration */
> >> =A0+ regmap_update_bits(mixer->regs,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_DEF);
> >> =A0+ regmap_update_bits(mixer->regs,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF);
> >
> > This should be in a property
>=20
> What property?

Alpha?

> >> =A0+}
> >> =A0+EXPORT_SYMBOL(sun8i_mixer_layer_enable);
> >> =A0+
> >> =A0+static int sun8i_mixer_drm_format_to_layer(struct drm_plane *plane,
> >> =A0+ u32 format, u32 *mode)
> >> =A0+{
> >> =A0+ if ((plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) &&
> >> =A0+ (format =3D=3D DRM_FORMAT_ARGB8888))
> >> =A0+ format =3D DRM_FORMAT_XRGB8888;
> >
> > Do you actually have that issue.
>=20
> Yes, it really do, at least screen go black when I set this to ARGB8888 in
> U-Boot. (U-Boot is a good experiement area ;-) )

Ok. And you have some color when you set the background to some colour ?

> >> =A0+ switch (format) {
> >> =A0+ case DRM_FORMAT_ARGB8888:
> >> =A0+ *mode =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_ARGB8888;
> >> =A0+ break;
> >> =A0+
> >> =A0+ case DRM_FORMAT_XRGB8888:
> >> =A0+ *mode =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_XRGB8888;
> >> =A0+ break;
> >> =A0+
> >> =A0+ case DRM_FORMAT_RGB888:
> >> =A0+ *mode =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_RGB888;
> >> =A0+ break;
> >> =A0+
> >> =A0+ default:
> >> =A0+ return -EINVAL;
> >> =A0+ }
> >> =A0+
> >> =A0+ return 0;
> >> =A0+}
> >> =A0+
> >> =A0+int sun8i_mixer_update_layer_coord(struct sun8i_mixer *mixer,
> >> =A0+ int layer, struct drm_plane *plane)
> >> =A0+{
> >> =A0+ struct drm_plane_state *state =3D plane->state;
> >> =A0+ struct drm_framebuffer *fb =3D state->fb;
> >> =A0+ /* Currently the first UI channel is used */
> >> =A0+ int chan =3D mixer->cfg->vi_num;
> >> =A0+ int i;
> >> =A0+
> >> =A0+ DRM_DEBUG_DRIVER("Updating layer %d\n", layer);
> >> =A0+
> >> =A0+ if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> >> =A0+ DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u=
\n",
> >> =A0+ state->crtc_w, state->crtc_h);
> >> =A0+ regmap_write(mixer->regs, SUN8I_MIXER_GLOBAL_SIZE,
> >> =A0+ SUN8I_MIXER_SIZE(state->crtc_w,
> >> =A0+ state->crtc_h));
> >> =A0+ DRM_DEBUG_DRIVER("Updating blender size\n");
> >> =A0+ for (i =3D 0; i < SUN8I_MIXER_MAX_CHAN_COUNT; i++)
> >> =A0+ regmap_write(mixer->regs,
> >> =A0+ SUN8I_MIXER_BLEND_ATTR_INSIZE(i),
> >> =A0+ SUN8I_MIXER_SIZE(state->crtc_w,
> >> =A0+ state->crtc_h));
> >> =A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_OUTSIZE,
> >> =A0+ SUN8I_MIXER_SIZE(state->crtc_w,
> >> =A0+ state->crtc_h));
> >> =A0+ DRM_DEBUG_DRIVER("Updating channel size\n");
> >> =A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_OVL_SIZE(chan),
> >> =A0+ SUN8I_MIXER_SIZE(state->crtc_w,
> >> =A0+ state->crtc_h));
> >> =A0+ }
> >> =A0+
> >> =A0+ /* Set the line width */
> >> =A0+ DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
> >> =A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_LAYER_PITCH(chan, l=
ayer),
> >> =A0+ fb->pitches[0]);
> >> =A0+
> >> =A0+ /* Set height and width */
> >> =A0+ DRM_DEBUG_DRIVER("Layer size W: %u H: %u\n",
> >> =A0+ state->crtc_w, state->crtc_h);
> >> =A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_LAYER_SIZE(chan, la=
yer),
> >> =A0+ SUN8I_MIXER_SIZE(state->crtc_w, state->crtc_h));
> >> =A0+
> >> =A0+ /* Set base coordinates */
> >> =A0+ DRM_DEBUG_DRIVER("Layer coordinates X: %d Y: %d\n",
> >> =A0+ state->crtc_x, state->crtc_y);
> >> =A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_LAYER_COORD(chan, l=
ayer),
> >> =A0+ SUN8I_MIXER_COORD(state->crtc_x, state->crtc_y));
> >> =A0+
> >> =A0+ return 0;
> >> =A0+}
> >> =A0+EXPORT_SYMBOL(sun8i_mixer_update_layer_coord);
> >> =A0+
> >> =A0+int sun8i_mixer_update_layer_formats(struct sun8i_mixer *mixer,
> >> =A0+ int layer, struct drm_plane *plane)
> >> =A0+{
> >> =A0+ struct drm_plane_state *state =3D plane->state;
> >> =A0+ struct drm_framebuffer *fb =3D state->fb;
> >> =A0+ bool interlaced =3D false;
> >> =A0+ u32 val;
> >> =A0+ /* Currently the first UI channel is used */
> >> =A0+ int chan =3D mixer->cfg->vi_num;
> >> =A0+ int ret;
> >> =A0+
> >> =A0+ if (plane->state->crtc)
> >> =A0+ interlaced =3D plane->state->crtc->state->adjusted_mode.flags
> >> =A0+ & DRM_MODE_FLAG_INTERLACE;
> >> =A0+
> >> =A0+ regmap_update_bits(mixer->regs, SUN8I_MIXER_BLEND_OUTCTL,
> >> =A0+ SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> >> =A0+ interlaced ?
> >> =A0+ SUN8I_MIXER_BLEND_OUTCTL_INTERLACED : 0);
> >> =A0+
> >> =A0+ DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> >> =A0+ interlaced ? "on" : "off");
> >> =A0+
> >> =A0+ ret =3D sun8i_mixer_drm_format_to_layer(plane, fb->format->format,
> >> =A0+ &val);
> >> =A0+ if (ret) {
> >> =A0+ DRM_DEBUG_DRIVER("Invalid format\n");
> >> =A0+ return ret;
> >> =A0+ }
> >> =A0+
> >> =A0+ regmap_update_bits(mixer->regs,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
> >> =A0+
> >> =A0+ return 0;
> >> =A0+}
> >> =A0+EXPORT_SYMBOL(sun8i_mixer_update_layer_formats);
> >> =A0+
> >> =A0+int sun8i_mixer_update_layer_buffer(struct sun8i_mixer *mixer,
> >> =A0+ int layer, struct drm_plane *plane)
> >> =A0+{
> >> =A0+ struct drm_plane_state *state =3D plane->state;
> >> =A0+ struct drm_framebuffer *fb =3D state->fb;
> >> =A0+ struct drm_gem_cma_object *gem;
> >> =A0+ dma_addr_t paddr;
> >> =A0+ uint32_t paddr_u32;
> >> =A0+ /* Currently the first UI channel is used */
> >> =A0+ int chan =3D mixer->cfg->vi_num;
> >> =A0+ int bpp;
> >> =A0+
> >> =A0+ /* Get the physical address of the buffer in memory */
> >> =A0+ gem =3D drm_fb_cma_get_gem_obj(fb, 0);
> >> =A0+
> >> =A0+ DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
> >> =A0+
> >> =A0+ /* Compute the start of the displayed memory */
> >> =A0+ bpp =3D fb->format->cpp[0];
> >> =A0+ paddr =3D gem->paddr + fb->offsets[0];
> >> =A0+ paddr +=3D (state->src_x >> 16) * bpp;
> >> =A0+ paddr +=3D (state->src_y >> 16) * fb->pitches[0];
> >> =A0+ paddr -=3D SUN8I_DRAM_OFFSET;
> >> =A0+
> >> =A0+ DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
> >> =A0+
> >> =A0+ paddr_u32 =3D (uint32_t) paddr;
> >> =A0+
> >> =A0+ regmap_write(mixer->regs,
> >> =A0+ SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(chan, layer),
> >> =A0+ paddr_u32);
> >> =A0+
> >> =A0+ return 0;
> >> =A0+}
> >> =A0+EXPORT_SYMBOL(sun8i_mixer_update_layer_buffer);
> >> =A0+
> >> =A0+static struct regmap_config sun8i_mixer_regmap_config =3D {
> >> =A0+ .reg_bits =3D 32,
> >> =A0+ .val_bits =3D 32,
> >> =A0+ .reg_stride =3D 4,
> >> =A0+ .max_register =3D 0xbffc, /* guessed */
> >> =A0+};
> >> =A0+
> >> =A0+static int sun8i_mixer_bind(struct device *dev, struct device *mas=
ter,
> >> =A0+ void *data)
> >> =A0+{
> >> =A0+ struct platform_device *pdev =3D to_platform_device(dev);
> >> =A0+ struct drm_device *drm =3D data;
> >> =A0+ struct sun4i_drv *drv =3D drm->dev_private;
> >> =A0+ struct sun8i_mixer *mixer;
> >> =A0+ struct resource *res;
> >> =A0+ void __iomem *regs;
> >> =A0+ int i, ret;
> >> =A0+
> >> =A0+ mixer =3D devm_kzalloc(dev, sizeof(*mixer), GFP_KERNEL);
> >> =A0+ if (!mixer)
> >> =A0+ return -ENOMEM;
> >> =A0+ dev_set_drvdata(dev, mixer);
> >> =A0+ drv->mixer =3D mixer;
> >> =A0+
> >> =A0+ mixer->cfg =3D of_device_get_match_data(dev);
> >> =A0+ if (!mixer->cfg)
> >> =A0+ return -EINVAL;
> >> =A0+
> >> =A0+ res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> =A0+ regs =3D devm_ioremap_resource(dev, res);
> >> =A0+ if (IS_ERR(regs))
> >> =A0+ return PTR_ERR(regs);
> >> =A0+
> >> =A0+ mixer->regs =3D devm_regmap_init_mmio(dev, regs,
> >> =A0+ &sun8i_mixer_regmap_config);
> >> =A0+ if (IS_ERR(mixer->regs)) {
> >> =A0+ dev_err(dev, "Couldn't create the mixer regmap\n");
> >> =A0+ return PTR_ERR(mixer->regs);
> >> =A0+ }
> >> =A0+
> >> =A0+ mixer->reset =3D devm_reset_control_get(dev, NULL);
> >> =A0+ if (IS_ERR(mixer->reset)) {
> >> =A0+ dev_err(dev, "Couldn't get our reset line\n");
> >> =A0+ return PTR_ERR(mixer->reset);
> >> =A0+ }
> >> =A0+
> >> =A0+ ret =3D reset_control_deassert(mixer->reset);
> >> =A0+ if (ret) {
> >> =A0+ dev_err(dev, "Couldn't deassert our reset line\n");
> >> =A0+ return ret;
> >> =A0+ }
> >> =A0+
> >> =A0+ mixer->bus_clk =3D devm_clk_get(dev, "bus");
> >> =A0+ if (IS_ERR(mixer->bus_clk)) {
> >> =A0+ dev_err(dev, "Couldn't get the mixer bus clock\n");
> >> =A0+ ret =3D PTR_ERR(mixer->bus_clk);
> >> =A0+ goto err_assert_reset;
> >> =A0+ }
> >> =A0+ clk_prepare_enable(mixer->bus_clk);
> >> =A0+
> >> =A0+ mixer->mod_clk =3D devm_clk_get(dev, "mod");
> >> =A0+ if (IS_ERR(mixer->mod_clk)) {
> >> =A0+ dev_err(dev, "Couldn't get the mixer module clock\n");
> >> =A0+ ret =3D PTR_ERR(mixer->mod_clk);
> >> =A0+ goto err_disable_bus_clk;
> >> =A0+ }
> >> =A0+ clk_prepare_enable(mixer->mod_clk);
> >
> > Supporting runtime_pm would be better.
>=20
> But I think it's at least not support yet for DE1 backend...

This is true, but unrelated.

> >> =A0+ /* Reset the registers */
> >> =A0+ for (i =3D 0x0; i < 0x20000; i +=3D 4)
> >> =A0+ regmap_write(mixer->regs, i, 0);
> >
> > Do you still need to reset it? Isn't the reset line enough?
>=20
> Nope, some strange data lies in the DE2 space.
>=20
> Here's a reg dump of a running DE2 's channel 2 on V3s:
> =3D> md 01104000
> 01104000: ff000403 010f01df 00000000 00000780    ................
> 01104010: 03f80000 00000000 00000000 00000000    ................
> 01104020: 00000000 00000000 00000000 00000000    ................
> 01104030: 00000000 00000000 00000000 00000000    ................
> 01104040: 00000000 00000000 00000000 00000000    ................
> 01104050: 00000000 00000000 00000000 00000000    ................
> 01104060: 00000000 00000000 00000000 00000000    ................
> 01104070: 00000000 00000000 00000000 00000000    ................
> 01104080: 00000000 00000000 010f01df bbe4d3b0    ................
> 01104090: 54daaf98 13835927 a1479b58 8396b8ad    ...T'Y..X.G.....
> 011040a0: 07d02ede a39a18da 87d88aba a2d23cf6    .............<..
> 011040b0: e8bfa8f7 2c8d2b7c f8bbeb3e 98013b75    ....|+.,>...u;..
> 011040c0: 7c186f48 4ddcdbde b658caf8 76b770d6    Ho.|...M..X..p.v
> 011040d0: b9a620ef fe215cc1 edd6c4b3 c5f7a66c    . ...\!.....l...
> 011040e0: 0d1ff6d3 956ca9e8 7f51f80a ad9a184a    ......l...Q.J...
> 011040f0: ff23e428 772d8d14 f4c03077 8bf495ca    (.#...-ww0......
>=20
> (P.S. only first 0x88 bytes are used in a UI channel, so the following is
> not reseted by U-Boot DE2 driver and is kept the original after reset line
> deasserting)

is it causing any issues? This is not unusual to have !0 default
values out of reset, and this shouldn't cause any troubles.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--diwan3xcga67crqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrhatAAoJEBx+YmzsjxAgqEQP/1SHV4vL38EIm+o7iBAu3uXe
6Nt+89SXmpV65sEo8LTKdYGxHIXY86L0hqfslqYfEBkucs8igt9kjkV1vv70suC8
SNSPMUzfqWicbhWKyA885AnKqSmIvPewfC4GgxGDQ9ZdKulq5O3hTdpAYLZnT1j+
Bm98ysbBrj348mCgMTjrgKJJ/FzznPPrhHK7Vocr2tUMBYrNksFteiKhO3kQrnda
EOHBW+M0D7OT6aP1P0eMqSgjWBCp9cReiM5j7vmuPaw64UlEB4vd/jFhMvZqZ4Jc
Gq0bwH+jl91t24gk4dHsS3acV8YsHHHnjKlXUKT9DmUqiJDsTiGJ31OYLm524djD
jVd7Nzs/oYsfIPF4u9mjEbOpvpNz6EbslIXwlgxkCQW4p9/hlvVq7pIae4gWqUNX
Z+aDYj3EH3V8Im4nuPX1pdxDURzhqA4eecTJvmrGKHrwcfqCcQyGNbe0nJgq38Qa
TA2HBofwBneWvaBUV1JKclyNCrPySRgwZGg6v1LyUlatn+kXMZkCx5xZs4aMuap7
nneNpnapaHoyrzab8teNW1Y1fuN8u69IeKDCEsjCIkxWDcM82yO4mJ7dW+GEtehT
wsZj7NZLi56jcfSNAdvwfUy2MnzwCNDk7v7qt/NrqFmglCbI9m+HDS2DaiZXKUte
fex6vcI1c2dVeP02sqEm
=Zh2w
-----END PGP SIGNATURE-----

--diwan3xcga67crqd--


--===============3044964557449109936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3044964557449109936==--
