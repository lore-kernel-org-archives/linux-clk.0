Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773156;
	b=05RHLXCI5//p70ErUaX0fLVHjlI/cvZuiBN9EeLzVag0bVPhaImKdWnzxYHe4a+YiBmk
	 8AkemN4eWbFZqnde4nADZR1pUvO4fLdZGAEe8cQH7YtHYaGtjFGa3sT/oaj6GaHiUvGqQ
	 vqyGD3NuczB0liueRwx1aZ6woZqgHCOLUASUwk5VuqGcZx7jRukZMYoDlOymhdqlHIdBE
	 m9kRBQ/xXt104dpb1TA3EbBWT/nhy5qTF5qKPq16RLbb38HpClNN5YXn7DgvDQDs5Hl9H
	 LOgs1M2jOVTFH+D9imV7zHk46YRONrObBVmyZytgGaQDwLXaOcqWGAxYmvSdXitnKHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773156;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=GJaEsAUs5iY5xuOs9aLJMvr/KwgNOBTvxn59QhAokoc=;
	b=ycTbtHExH7b/dQu5Z5QvgGm/7pgCniIyVghGAOnXr4uuAecCEZGwgsLYWldZ+8GFUKtK
	 sYypmGOzd3KE8WgCJUcCRC+PRKVjL2X28AOmlDPMyCabVIk30vT5V+M5E5vggHtMX6xGv
	 OWoCLIBYz4Qzb1yfzof06IDMWTS9MpOiSmJgdcKDESeBM/qMtA65V0FS8Y3POhOJw5E0P
	 we+8Ao6zmwYR1HDkB1YzrfRHKQq03x13heKaVlajNa/RZz2HdMVTeFqMqPjN1h5P4/iFg
	 lz3oK2seiS5R+b9yMvy/1r5bjjiiZRXB8vgCa7f6rFSDQpPui61/+sGxoKovuWjfdmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="b/7K4SLQ";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D5606A31B
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 300D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b/7K4SLQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6820C51464;
	Fri, 23 Oct 2026 16:33:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD2BB60398;
	Fri, 23 Oct 2026 16:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAE7A1032902F;
	Fri, 23 Oct 2026 18:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792773147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GJaEsAUs5iY5xuOs9aLJMvr/KwgNOBTvxn59QhAokoc=;
	b=b/7K4SLQrEUfvlJZ21l0bHavKh2fwL+sBqvQoA9vMBAnYRa9Fx6i7jB288fELO7lx8Q6aB
	L7amEk2PoqLRf7ON0d/L3VAgjuEXiaRH8ElumIYoH74qU6IxSvYQkJR6bGYBcM6Refv4h/
	aHS+7HaEkVoY6RRHEOlQ+Zk9xda2H2Ph7CJIonF2oz5lr28WME6yVzc2JyScv/PbqsXpRl
	IHuc38eqbE+O5/Is0OnWOgTWCghBB48iKxPDW8hYvdhtuucHW8JZCLT704Wq9IFs7tLCnl
	8IhXLf+Udkt/6Hln2I7apz+t3grcOq9ysARa1SdNUyVWVf5WHMw4tyrK3nbxtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,  Stephen Boyd <sboyd@kernel.org>,
  Abel Vesa <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@gehealthcare.com>,
  =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
In-Reply-To: <1jtsmch5id.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Fri, 23 Oct 2026 16:10:34 +0200")
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
	<atjIIHkoNwBVDO5b@redhat.com>
	<1jtsmch5id.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 23 Oct 2026 18:32:22 +0200
Message-ID: <87h5icnzs9.fsf@bootlin.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 23/10/2026 at 16:10:34 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On mer. 21 oct. 2026 at 10:11, Brian Masney <bmasney@redhat.com> wrote:
>
>> Hi Miquel (and Jerome),
>>
>> On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
>>> Hello,
>>>=20
>>> Thanks to Brian's series, we can finally solve the problem of rate
>>> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
>>> series using a v7.1 mainline kernel with a lot of unrelated DRM
>>> patches. I then re-applied it on top of clk-next after fixing the few
>>> conflicts when applying Brian's series, but that means I cannot (yet)
>>> run a 7.2/7.3 kernel on the platform (and applying this series with b4
>>> will fail due to Brian's series no longer applying on top of clk-next).
>>>=20
>>> The DTS patch is there for reference, I don't mind if it's not picked
>>> up.
>>>=20
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> Thanks for testing and posting this!
>>
>> I know that Jerome would like to see some changes to my rate change
>> series before it can be merged. I'm going to probably poorly describe
>> his concerns here, so apologies in advance if I miscommunicate this
>> Jerome. I'd appreciate it if you could clarify.
>>
>> - Currently the latest version posted (v8) to the list has the LCM
>>   helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
>>   helper should be in clk-divider.c. I agree that it should be in the
>>   divider code, but we'd have to export some additional APIs to allow
>>   that. In the future if we went with what's in v8, and wanted to fix
>>   the fractional dividers, then it would need a similar type of helper
>>   in clk.c, which is not ideal. I initially went with this approach to
>>   limit the APIs that are exported from the clk core.
>>
>> - I have a draft v9 series that I haven't posted yet that adds two new
>>   helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
>>   similar to the existing functions for the parents. This allows moving
>>   the LCM logic into clk-divider.c where it belongs, however the
>>   downside to this approach is that it expands the clk exported APIs so
>>   that providers will be able to fully walk the clk tree. The concern is
>>   that providers may abuse this in the future and it may limit future
>>   changes / cleanups to the clk core. For example, if we wanted to clean
>>   up the way locking is done, this may potentially limit the available
>>   options.
>>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=
=3Dclk-divider-scaling-v9
>>
>> - He would like to see it where each clk consumer sets the min/max rate
>>   that's acceptable, and the clk scaling in the provider takes those
>>   ranges into account when rates are negotiated.
>>
>> Anyways, please chime in Jerome if I got this right / wrong, and any
>> additional concerns.
>>
>
> Hi Brian, Miquel,
>
> Thanks Brian for the summary, and Miquel for testing and posting this.
> The i.MX8MP LDB/pixel case is a real problem and I'd like us to solve
> it. My concerns are about how, more than whether.
>
> You got most of it. The main nuance is I want to convey is where it
> should live IMO: not in a divider helper, and not in providers at all,
> but in the core. I'll try to explain.
>
> So far, CCF has preserved the settings of each element, or more
> honestly, left them alone: if a divider divides by 4, it keeps doing so
> whatever happens to its parent. This behavior has been there for years
> and many devices rely on it, even if unknowingly. Miquel, I understand
> you would rather make the new behavior the default, but I think this one
> is here to stay. That said, it would be nice to have a way to say that
> the rate should be preserved rather than the setting. I'll come back
> to that.
>
> My first concern is about the responsibilities of each component. IMO a
> provider should only describe the transfer function it implements:
> "given this parent rate, here is what I can do". It should not walk
> the tree or care about what its children are doing. Coordinating the
> providers is the core's job, without assumptions about their transfer
> functions.
>
> Providers already query their parents: a mux asks each candidate
> parent what it can provide, and a clock with CLK_SET_RATE_PARENT
> forwards its request upward. That is the request path, and the core
> stays in charge of it. Reading the state of children or siblings, and
> deciding on their behalf, is a different thing. Once a provider is
> allowed to do that, there is no good reason to deny it to the others,
> and I think that would make the core much harder to maintain. It could
> also get in the way of other pressing work, like the global lock problem,
> where tree walking will certainly play a critical role. Miquel's
> patch 2 is a good illustration: the helper ends up comparing the
> clk_hw of the tree with the inner clk_hw of a composite, which is not
> part of the tree.
>
> My second concern is that it is tied to the integer divider, since it
> relies on the LCM. If another element with a different transfer
> function sits on the path, it does not work, as we discussed. We could
> extend the principle to other types, but:
> * I don't see how the different types would reconcile, since each one
>   does its own thing in its own .determine_rate();
> * the change is no longer simple and harmless if it has to spread to
>   every provider to work.
>
> The behavior is also hard for consumers to predict. For example, the
> parent rate is only negotiated with the subtree of the divider's
> direct parent. With a gate between the divider and the PLL, the other
> branches of the PLL are left out. That could be fixed with more tree
> walking in the provider, which brings us back to my first point.
>
> If such a mechanism is needed, I would much prefer it done entirely in
> the core, in a generic way, with no assumption about the transfer
> functions involved. I realize this may go against a direction
> suggested at a previous LPC, which this series followed, and I think the
> points above are worth reconsidering it for.
>
> I say "if" because I doubt clock trees are designed with runtime rate
> negotiation in mind. So far, we have mostly dealt with these cases by
> removing CLK_SET_RATE_PARENT and using assigned-clock-rates on the
> shared ancestor. I understand that falls short when the PLL has to
> follow the display mode, as here.
>
> For rate negotiation, my suggestion would be to reuse what the
> framework already has: clock ranges, and re-running .determine_rate()
> on the children being dragged along, with the common ancestor's rate
> pinned. When that rate does not suit a sibling's range, other ancestor
> rates can be tried within the constraints, rather than giving up.
>
> clk_set_rate() is a best effort function. It tries to get as close to
> the request as possible, honoring the ranges of every clock along the
> path, and it is up to the consumer to decide whether the result is
> good enough. That decision is lost if the framework recomputes the
> rates of a sibling branch on its own. Ranges could help it decide:
> either "I'm fine with the new rate", or -EBUSY.

I see an upside with this approach: we could keep one single rate
negotiation logic. But it still requires modifications to be done on a
per user basis to be enabled (but that is needed from your perspective).

While I fully understand all the concerns expressed above, there has
been one minor point that arose while working on your series: it's
very hard to determine the tolerance beyond which the clock rate shall
be refused. Expect bikeshedding on a per driver basis.

> What I'm suggesting is to treat any clock with a range as one that
> needs updating. Its consumer cared enough to tell us what it can and
> cannot cope with. That removes the need for a specific flag, and puts
> the rate policy in the consumer, which is where I'd prefer use case
> choices to live, rather than in the provider or the core. It would
> also fix clocks being dragged out of their range during an update.
> Presumably, a clock without a range does not care enough to give us a
> decider, so the framework has no basis to act on its behalf and keeps
> today's behavior. I think this behavior will keep on being good enough
> for the vast majority clocks out there and it is a lot lighter
> on the math side (which is already quite severe as it is)

Well, yeah, I see we share conclusions :-)

> I've been checking whether the idea is remotely feasible. It involves
> multiple planning stages and multiple tops. It is still very rough,
> but there is the beginning of something:
>
> https://github.com/jbrun3t/linux/commits/clk/clk-rate-range-update/
>
> Miquel, if you fancy trying it, please let me know whether it works
> for you. All you should need is to set a range on the clocks you care
> about.

I managed to pull most of the clock patches in your branch and apply
them to my 7.2 branch (with a couple of tweaks). I then made the changes
to request a tolerance as you hinted (available below) in the two
relevant drivers: it worked as expected!

While doing so, I realized the whole operation (set rate, set rate
range, get rate and verify) needs to be repeated almost identically in
every user of the "tolerance composition" logic, which probably
indicates that a core helper would be relevant instead. I had in mind
something like ~clk_set_rate_and_tolerance() which would do the
equivalent of my fsl_ldb_link_rate_set() and lcdif_pixel_rate_set()
helpers.

> Sorry for this rather long explanation.
>
> Brian, your series is what got this discussion going, I know a lot of
> efforts have gone into it already. I'd be glad to work on this together.

In case that is relevant, here is below the code snippet which I used to
get my panels working after removing the assigned rates from the DTS on
i.MX8MP.

Thanks,
Miqu=C3=A8l

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-=
ldb.c
index 1d65c75845a4..db17b26b7f3f 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -16,6 +16,13 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
=20
+#define FSL_LDB_CLK_TOLERANCE_PERCENT  1
+
 #define LDB_CTRL_CH0_ENABLE                    BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT                 BIT(1)
 #define LDB_CTRL_CH1_ENABLE                    BIT(2)
@@ -111,6 +118,44 @@ static unsigned long fsl_ldb_link_frequency(struct fsl=
_ldb *fsl_ldb, int clock)
                return clock * 7000;
 }
=20
+static int fsl_ldb_link_rate_set(struct fsl_ldb *fsl_ldb,
+                                const struct drm_display_mode *mode)
+{
+       unsigned long requested_link_freq, min_link_freq, max_link_freq;
+       unsigned long configured_link_freq;
+       int ret;
+
+       requested_link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clock=
);
+       min_link_freq =3D requested_link_freq -
+                       requested_link_freq * FSL_LDB_CLK_TOLERANCE_PERCENT=
 / 100;
+       max_link_freq =3D requested_link_freq +
+                       requested_link_freq * FSL_LDB_CLK_TOLERANCE_PERCENT=
 / 100;
+
+       ret =3D clk_set_rate(fsl_ldb->clk, requested_link_freq);
+       if (ret) {
+               dev_err(fsl_ldb->dev, "Failed to set %pC to %lu Hz: %d\n",
+                       fsl_ldb->clk, requested_link_freq, ret);
+               return ret;
+       }
+
+       ret =3D clk_set_rate_range(fsl_ldb->clk, min_link_freq, max_link_fr=
eq);
+       if (ret) {
+               dev_err(fsl_ldb->dev,
+                       "Failed to keep %pC in [%lu, %lu] Hz: %d\n",
+                       fsl_ldb->clk, min_link_freq, max_link_freq, ret);
+               return ret;
+       }
+
+       configured_link_freq =3D clk_get_rate(fsl_ldb->clk);
+       if (configured_link_freq < min_link_freq ||
+           configured_link_freq > max_link_freq)
+               dev_warn(fsl_ldb->dev,
+                        "Configured %pC clock (%lu Hz) does not match requ=
ested LVDS clock: %lu Hz\n",
+                        fsl_ldb->clk, configured_link_freq, requested_link=
_freq);
+
+       return 0;
+}
+
 static int fsl_ldb_attach(struct drm_bridge *bridge,
                          struct drm_encoder *encoder,
                          enum drm_bridge_attach_flags flags)
@@ -130,11 +175,10 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *=
bridge,
        const struct drm_display_mode *mode;
        struct drm_connector *connector;
        struct drm_crtc *crtc;
-       unsigned long configured_link_freq;
-       unsigned long requested_link_freq;
        bool lvds_format_24bpp;
        bool lvds_format_jeida;
        u32 reg;
+       int ret;
=20
        /* Get the LVDS format from the bridge state. */
        bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
@@ -175,14 +219,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *b=
ridge,
        crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
        mode =3D &crtc_state->adjusted_mode;
=20
-       requested_link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clock=
);
-       clk_set_rate(fsl_ldb->clk, requested_link_freq);
-
-       configured_link_freq =3D clk_get_rate(fsl_ldb->clk);
-       if (configured_link_freq !=3D requested_link_freq)
-               dev_warn(fsl_ldb->dev,
-                        "Configured %pC clock (%lu Hz) does not match requ=
ested LVDS clock: %lu Hz\n",
-                        fsl_ldb->clk, configured_link_freq, requested_link=
_freq);
+       ret =3D fsl_ldb_link_rate_set(fsl_ldb, mode);
+       if (ret)
+               return;
=20
        clk_prepare_enable(fsl_ldb->clk);
=20
@@ -241,6 +280,8 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *b=
ridge,
        regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
=20
        clk_disable_unprepare(fsl_ldb->clk);
+
+       clk_drop_range(fsl_ldb->clk);
 }
=20
 #define MAX_INPUT_SEL_FORMATS 1
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdi=
f_kms.c
index ade76c3f4e4e..2dddb82e0269 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -32,6 +32,13 @@
 #include "lcdif_drv.h"
 #include "lcdif_regs.h"
=20
+#define LCDIF_PIXEL_CLK_TOLERANCE_PERCENT      1
+
 struct lcdif_crtc_state {
        struct drm_crtc_state   base;   /* always be the first member */
        u32                     bus_format;
@@ -527,6 +534,38 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc *c=
rtc,
        spin_unlock_irq(&crtc->dev->event_lock);
 }
=20
+static int lcdif_pixel_rate_set(struct lcdif_drm_private *lcdif,
+                               const struct drm_display_mode *m)
+{
+       unsigned long pix_rate =3D m->clock * 1000;
+       unsigned long min_rate, max_rate;
+       int ret;
+
+       /*
+        * Pin the pixel rate so a change on the PLL made for another branch
+        * (typically the LDB serializer clock) does not drag it away.
+        */
+       min_rate =3D pix_rate - pix_rate * LCDIF_PIXEL_CLK_TOLERANCE_PERCEN=
T / 100;
+       max_rate =3D pix_rate + pix_rate * LCDIF_PIXEL_CLK_TOLERANCE_PERCEN=
T / 100;
+
+       ret =3D clk_set_rate(lcdif->clk, pix_rate);
+       if (ret) {
+               drm_err(lcdif->drm, "Failed to set pixel clock to %lu Hz: %=
d\n",
+                       pix_rate, ret);
+               return ret;
+       }
+
+       ret =3D clk_set_rate_range(lcdif->clk, min_rate, max_rate);
+       if (ret) {
+               drm_err(lcdif->drm,
+                       "Failed to keep pixel clock in [%lu, %lu] Hz: %d\n",
+                       min_rate, max_rate, ret);
+               return ret;
+       }
+
+       return 0;
+}
+
 static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
                                     struct drm_atomic_commit *state)
 {
@@ -537,8 +576,11 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *=
crtc,
        struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
        struct drm_device *drm =3D lcdif->drm;
        dma_addr_t paddr;
+       int ret;
=20
-       clk_set_rate(lcdif->clk, m->clock * 1000);
+       ret =3D lcdif_pixel_rate_set(lcdif, m);
+       if (ret)
+               return;
=20
        pm_runtime_get_sync(drm->dev);
=20
@@ -568,6 +610,8 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *=
crtc,
=20
        lcdif_disable_controller(lcdif);
=20
+       clk_drop_range(lcdif->clk);
+
        spin_lock_irq(&drm->event_lock);
        event =3D crtc->state->event;
        if (event) {
