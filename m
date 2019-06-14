Return-Path: <SRS0=ubJx=UN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59A4C31E4E
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 20:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83A1C217F9
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560544583;
	bh=RQFeY7ClB3qfZKUqanGUTFvCrvIQv9xp/N5O5ZqmrGM=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=BWDIikPbszOuGL/l6gdOpjwptN5FEkWk+K5jVBJqXMpp5qT2lnmq4hxuQoay8QF9g
	 N29s9crs61EBfXipVLqxaGFu70kAxodWu7hrZq0VyAW9Lls9sz6gj+GK3WE669+xZO
	 fCLw1WtYb/wDOUtHYRB9eXdW14UzF3oonVBjgc1s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbfFNUgL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jun 2019 16:36:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:35052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727177AbfFNUgL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Jun 2019 16:36:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 959DA217F9;
        Fri, 14 Jun 2019 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560544570;
        bh=RQFeY7ClB3qfZKUqanGUTFvCrvIQv9xp/N5O5ZqmrGM=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=fr/TmeQBEPKbLUgkDfSTEhkYS/y4YHrr57CLOtIcGW9sNuajAET5wxTQr07bnOLMh
         7hE0zaI6D/yrtKuLXwSnBM8hQhS5xdVHThZ7fMOEmZ7C8C+zVH7d80njyK4SeX5nv0
         p/a54K9i3XcPK0xQHnK47DZ6q/7T0QjynQ0+X/6Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <13456600.FWPkgmLa5g@phil>
References: <20190614165454.13743-1-heiko@sntech.de> <20190614174526.6F805217D6@mail.kernel.org> <19cea8f7c279ef6efb12d1ec0822767d@risingedge.co.za> <13456600.FWPkgmLa5g@phil>
To:     Heiko Stuebner <heiko@sntech.de>,
        Justin Swartz <justin.swartz@risingedge.co.za>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add display nodes for rk322x
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Fri, 14 Jun 2019 13:36:09 -0700
Message-Id: <20190614203610.959DA217F9@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-06-14 12:33:12)
> Am Freitag, 14. Juni 2019, 20:32:35 CEST schrieb Justin Swartz:
> > On 2019-06-14 19:45, Stephen Boyd wrote:
> > >> diff --git a/arch/arm/boot/dts/rk322x.dtsi=20
> > >> b/arch/arm/boot/dts/rk322x.dtsi
> > >> index da102fff96a2..148f9b5157ea 100644
> > >> --- a/arch/arm/boot/dts/rk322x.dtsi
> > >> +++ b/arch/arm/boot/dts/rk322x.dtsi
> > >> @@ -143,6 +143,11 @@
> > >> #clock-cells =3D <0>;
> > >> };
> > >>=20
> > >> +       display_subsystem: display-subsystem {
> > >> +               compatible =3D "rockchip,display-subsystem";
> > >> +               ports =3D <&vop_out>;
> > >> +       };
> > >> +
> > >=20
> > > What is this? It doesn't have a reg property so it looks like a virtu=
al
> > > device. Why is it in DT?
> >=20
> > This is a virtual device.
> >=20
> > I assumed it would be acceptable to it find in a device tree due to=20
> > binding documentation,=20
> > "Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt,=20
> > which states:
> >=20
> > <quote>
> > The Rockchip DRM master device is a virtual device needed to list all
> > vop devices or other display interface nodes that comprise the
> > graphics subsystem.
> > </quote>
> >=20
> > Without the "display_subsystem" device node, the HDMI PHY and=20
> > rockchipdrmfb frame buffer device are not initialized.
> >=20
> > Perhaps I should have included this in my commit message? :)
>=20
> As Justin said, that is very much common as the root of the components
> that make up the drm device and pretty much common in a lot of devicetrees
> for the last 5 years and longer ;-) .
>=20
> Also gpio-keys also don't have a reg property ;-) .
>=20

Do you have a SoC node? If so, this virtual device should live in the
root, away from the nodes that have reg properties and are thus in the
SoC node.

