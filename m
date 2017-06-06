Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 6 Jun 2017 21:27:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 14/19] drm/sun4i: hdmi: Add support for A31's HDMI
 controller
Message-ID: <20170606192744.sktuiwm3udn623gt@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-15-wens@csie.org>
 <20170602194110.goale2ssyg5vuqiv@flea.lan>
 <CAGb2v65eFAmAybmHkQcKjF+ZKxh+_G6q9i2GPzMs5854X8bQug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kaeyxzg3n7kjyrdh"
In-Reply-To: <CAGb2v65eFAmAybmHkQcKjF+ZKxh+_G6q9i2GPzMs5854X8bQug@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--kaeyxzg3n7kjyrdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 03, 2017 at 11:19:09PM +0800, Chen-Yu Tsai wrote:
> On Sat, Jun 3, 2017 at 3:41 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Fri, Jun 02, 2017 at 06:10:19PM +0800, Chen-Yu Tsai wrote:
> >> The HDMI controller found in the A31 SoCs is slightly different
> >> from the one already supported, which is found in the A10s:
> >>
> >>   - Need different initial values for the PLL related registers
> >>
> >>   - Different behavior of the DDC and TMDS clocks
> >>
> >>   - Different register layout for the DDC portion
> >>
> >>   - Separate DDC parent clock
> >>
> >> This patch adds support for it.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  drivers/gpu/drm/sun4i/sun4i_hdmi.h     |   3 +
> >>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 141 ++++++++++++++++++++++++=
+++++++++
> >>  2 files changed, 144 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4=
i/sun4i_hdmi.h
> >> index c63d0bd95963..2589bc92be59 100644
> >> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> >> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> >> @@ -56,10 +56,13 @@
> >>  #define SUN4I_HDMI_PAD_CTRL0_TXEN            BIT(23)
> >>
> >>  #define SUN4I_HDMI_PAD_CTRL1_REG     0x204
> >> +#define SUN4I_HDMI_PAD_CTRL1_UNKNOWN         BIT(24) /* set on A31 */
> >>  #define SUN4I_HDMI_PAD_CTRL1_AMP_OPT         BIT(23)
> >>  #define SUN4I_HDMI_PAD_CTRL1_AMPCK_OPT               BIT(22)
> >>  #define SUN4I_HDMI_PAD_CTRL1_EMP_OPT         BIT(20)
> >>  #define SUN4I_HDMI_PAD_CTRL1_EMPCK_OPT               BIT(19)
> >> +#define SUN4I_HDMI_PAD_CTRL1_PWSCK           BIT(18)
> >> +#define SUN4I_HDMI_PAD_CTRL1_PWSDT           BIT(17)
> >>  #define SUN4I_HDMI_PAD_CTRL1_REG_DEN         BIT(15)
> >>  #define SUN4I_HDMI_PAD_CTRL1_REG_DENCK               BIT(14)
> >>  #define SUN4I_HDMI_PAD_CTRL1_REG_EMP(n)              (((n) & 7) << 10)
> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/=
sun4i/sun4i_hdmi_enc.c
> >> index 9ded40aaed32..e9abf93eb41c 100644
> >> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> >> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> >> @@ -293,6 +293,109 @@ static const struct drm_connector_helper_funcs s=
un4i_hdmi_connector_helper_funcs
> >>       .get_modes      =3D sun4i_hdmi_get_modes,
> >>  };
> >>
> >> +static int sun6i_hdmi_read_sub_block(struct sun4i_hdmi *hdmi,
> >> +                                  unsigned int blk, unsigned int offs=
et,
> >> +                                  u8 *buf, unsigned int count)
> >> +{
> >> +     unsigned long reg;
> >> +     int i;
> >> +
> >> +     reg =3D readl(hdmi->base + SUN6I_HDMI_DDC_FIFO_CTRL_REG);
> >> +     writel(reg | SUN6I_HDMI_DDC_FIFO_CTRL_CLEAR,
> >> +            hdmi->base + SUN6I_HDMI_DDC_FIFO_CTRL_REG);
> >> +     writel(SUN6I_HDMI_DDC_ADDR_SEGMENT(offset >> 8) |
> >> +            SUN6I_HDMI_DDC_ADDR_EDDC(DDC_SEGMENT_ADDR << 1) |
> >> +            SUN6I_HDMI_DDC_ADDR_OFFSET(offset) |
> >> +            SUN6I_HDMI_DDC_ADDR_SLAVE(DDC_ADDR),
> >> +            hdmi->base + SUN6I_HDMI_DDC_ADDR_REG);
> >> +
> >> +     writel(SUN6I_HDMI_DDC_CMD_EXPLICIT_EDDC_READ |
> >> +            SUN6I_HDMI_DDC_CMD_BYTE_COUNT(count),
> >> +            hdmi->base + SUN6I_HDMI_DDC_CMD_REG);
> >> +
> >> +     reg =3D readl(hdmi->base + SUN6I_HDMI_DDC_CTRL_REG);
> >> +     writel(reg | SUN6I_HDMI_DDC_CTRL_START_CMD,
> >> +            hdmi->base + SUN6I_HDMI_DDC_CTRL_REG);
> >> +
> >> +     if (readl_poll_timeout(hdmi->base + SUN6I_HDMI_DDC_CTRL_REG, reg,
> >> +                            !(reg & SUN6I_HDMI_DDC_CTRL_START_CMD),
> >> +                            100, 100000))
> >> +             return -EIO;
> >> +
> >> +     for (i =3D 0; i < count; i++)
> >> +             buf[i] =3D readb(hdmi->base + SUN6I_HDMI_DDC_FIFO_DATA_R=
EG);
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +static int sun6i_hdmi_read_edid_block(void *data, u8 *buf, unsigned i=
nt blk,
> >> +                                   size_t length)
> >> +{
> >> +     struct sun4i_hdmi *hdmi =3D data;
> >> +     int retry =3D 2, i;
> >> +
> >> +     do {
> >> +             for (i =3D 0; i < length; i +=3D SUN4I_HDMI_DDC_FIFO_SIZ=
E) {
> >> +                     unsigned char offset =3D blk * EDID_LENGTH + i;
> >> +                     unsigned int count =3D min((unsigned int)SUN4I_H=
DMI_DDC_FIFO_SIZE,
> >> +                                              length - i);
> >> +                     int ret;
> >> +
> >> +                     ret =3D sun6i_hdmi_read_sub_block(hdmi, blk, off=
set,
> >> +                                                     buf + i, count);
> >> +                     if (ret)
> >> +                             return ret;
> >> +             }
> >> +     } while (!drm_edid_block_valid(buf, blk, true, NULL) && (retry--=
));
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +static int sun6i_hdmi_get_modes(struct drm_connector *connector)
> >> +{
> >> +     struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(connecto=
r);
> >> +     u32 reg;
> >> +     struct edid *edid;
> >> +     int ret;
> >> +
> >> +     clk_set_rate(hdmi->ddc_clk, 100000);
> >> +     clk_prepare_enable(hdmi->ddc_clk);
> >> +
> >> +     /* Reset i2c controller */
> >> +     writel(SUN6I_HDMI_DDC_CTRL_ENABLE | SUN6I_HDMI_DDC_CTRL_RESET |
> >> +            SUN6I_HDMI_DDC_CTRL_SDA_ENABLE |
> >> +            SUN6I_HDMI_DDC_CTRL_SCL_ENABLE,
> >> +            hdmi->base + SUN6I_HDMI_DDC_CTRL_REG);
> >> +     if (readl_poll_timeout(hdmi->base + SUN6I_HDMI_DDC_CTRL_REG, reg,
> >> +                            !(reg & SUN6I_HDMI_DDC_CTRL_RESET),
> >> +                            100, 2000)) {
> >> +             dev_err(hdmi->dev, "DDC reset timeout: %08x\n", reg);
> >> +             clk_disable_unprepare(hdmi->ddc_clk);
> >> +             return -EIO;
> >> +     }
> >> +
> >> +     edid =3D drm_do_get_edid(connector, sun6i_hdmi_read_edid_block, =
hdmi);
> >> +
> >> +     clk_disable_unprepare(hdmi->ddc_clk);
> >> +
> >> +     if (!edid)
> >> +             return 0;
> >> +
> >> +     hdmi->hdmi_monitor =3D drm_detect_hdmi_monitor(edid);
> >> +     DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
> >> +                      hdmi->hdmi_monitor ? "an HDMI" : "a DVI");
> >> +
> >> +     drm_mode_connector_update_edid_property(connector, edid);
> >> +     ret =3D drm_add_edid_modes(connector, edid);
> >> +     kfree(edid);
> >> +
> >> +     return ret;
> >> +}
> >> +
> >> +static const struct drm_connector_helper_funcs sun6i_hdmi_connector_h=
elper_funcs =3D {
> >> +     .get_modes      =3D sun6i_hdmi_get_modes,
> >> +};
> >> +
> >
> > Every thing here can be handled through regfield without having to
> > duplicate the logic.
>=20
> Hmm... You're right. Does that mean we should convert the entire driver to
> using regmap? Or just the DDC bits here, since they won't conflict with
> any other access patterns in the whole HDMI driver?

I guess we could just convert everything (and I wish I would have done
it before...)

> >>  static enum drm_connector_status
> >>  sun4i_hdmi_connector_detect(struct drm_connector *connector, bool for=
ce)
> >>  {
> >> @@ -367,6 +470,43 @@ static const struct sun4i_hdmi_variant sun5i_vari=
ant =3D {
> >>                                 SUN4I_HDMI_PLL_CTRL_PLL_EN,
> >>  };
> >>
> >> +static const struct sun4i_hdmi_variant sun6i_variant =3D {
> >> +     .connector_helpers      =3D &sun6i_hdmi_connector_helper_funcs,
> >> +     .ddc_create             =3D sun6i_ddc_create,
> >> +     .tmds_create            =3D sun6i_tmds_create,
> >> +     .has_ddc_parent_clk     =3D true,
> >> +     .has_reset_control      =3D true,
> >> +     .pad_ctrl0_init_val     =3D 0xff |
> >
> > What is this 0xff for?
>=20
> Unknown. It is set in the mainline U-boot driver.
>=20
> Looking at an old 3.3 kernel from the BSP, it seems the higher 4 bits
> control the transmitter. But the lower 4 bits are still unknown.

Can you add a comment for that?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kaeyxzg3n7kjyrdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZNwIwAAoJEBx+YmzsjxAg88UP/jXMtp6rZZQSALgJPeMhMnuC
ADQJuGFs5l2dHVj3ZDIP9619U2mdXmV9c5IUPiQMqnUPUx8iYDin0rMgr/5oIoni
b/M3/z7CBkwMeun3rLIHhZaru7Vr/Li8nR4lIGehBW21mvOL6cS+fJe1t35cJvbd
3+Oivj/L0fc/CgpLMq245rx7Wa58+S75wFGJLsHFV0WMcFXlimMnYVLVoRf4P1wa
CvNXW5iCskMplkxHdA0PWsFvGvuwWeEBNW8eZ6f8d7xT/H/wcC8J0SVevMmC3Vzd
SzWHTw3i0RuBuVuJEYMMIDsD10rYjXLU3gOmQpqhRAOzIPWmbWa6J7X1jDBcnwcB
UxOXeZb82+d54DCuyHmoaU9o2a/mpGYB4ZwL27P0L2GIeyBoV3ZF9/maI74yiaog
4qNymOHpUoqKuSpfzQ5TDcbD7stjbAM3zw5htZBOBgY2quExa524dfjii+nNtTBd
NXdT+Lf5PDfGqSes6/fcVWYegIhrOTU4vgFCpBb6fVfas0iW3jlxWQKvG07Bi76X
LuJdhf5R/Yd+qwNMu3IUzgsEq5cJVHaexZeXv2VfcOiwrykrKfPrfkM0Efzxfbbq
v/YaM2SJ4aJgDEd9x7UHkUGB1umuJ9U+UmdXYb+unCxWwdDEs/gx9NFkCHQ8avqt
E/xnQrUmri1ZaYKwVmTb
=FIBi
-----END PGP SIGNATURE-----

--kaeyxzg3n7kjyrdh--
