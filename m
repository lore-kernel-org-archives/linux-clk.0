Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759CDC10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:43:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C8972082E
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfDKRnZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 13:43:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:55494 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726391AbfDKRnY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 13:43:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B7A65AC24
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 17:43:23 +0000 (UTC)
Message-ID: <79606818706359d32f34c7eb2523d6557747c262.camel@suse.de>
Subject: Is exporting __clk_notify() acceptable?
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux-clk@vger.kernel.org
Date:   Thu, 11 Apr 2019 19:43:22 +0200
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-kCF8cqPyfNvDUkkgv/n5"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--=-kCF8cqPyfNvDUkkgv/n5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I'm working on implementing proper cpufreq support for Raspberry Pi and stu=
mbled
upon an issue I'd like your opinion on:

- Raspberry Pi's boot and other internal operations are operated by a firmw=
are
  running in it's VPU/GPU (called Video Core 4).

- Even though Raspberry Pi exports it's clock registers, we're unable to mo=
dify
  them as we could clash with the firmware. Messing around with clocks behi=
nd
  the firmware's back would potentially void the board's warranty or even b=
reak
  it. So we're stuck using a firmware frequency scaling interface the board
  provides.

- Some peripherals depend on VPU's clock (I2C, SPI, UART, ...). This clock =
is
  updated by the firmware interface whenever we scale the frequency.

- A solution would be to set all these clocks as non cachable, and alert th=
e
  peripherals through the clock notifier before and after the frequency sca=
ling
  happens. This way they could reprogram their dividers. It would be trigge=
red
  through a custom cpufreq driver that, with the knowledge of the possible =
VPU
  frequencies, will pre-notify the peripherals, trigger the frequency scali=
ng
  and post-notify the peripherals. In order to achieve this, I figured I ne=
ed
  to create an exported version of __clk_notify(), which would trigger
  notifications both for the provided clock and it's children.

In principle, would it be acceptable to export the function? Any alternativ=
es?

Note that cpufreq notifiers are not an option as they provide the CPU clock
change rates which are useless to the peripherals. Also note that the
peripherals need to know the clock rate change in advance.

Thanks!
Nicolas


--=-kCF8cqPyfNvDUkkgv/n5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAlyvfLoACgkQlfZmHno8
x/4iIAgAkqNlE2pqiWOiDuuuzmuJc+n9I0wiiKajg3ZZyj10vvPBayNBHZOz7dfS
HlBtP9MlbH0vZ9Q8w5j+tb0adDL0TcNEq0QFsgBbjAwgbCAewBCW1roLnyJ5+Jlh
CXGelExCDEC4TPjhBESTOLA9PmZEOfvs1unaPW1NckIBnWNY6GtshdMjfX5a6DcI
K60ipbYqqbCmaiBZbnEe/9VeEuyHzUd1AGhZYh+H4p+B18/e+dyqTopxOZxHJDWL
8zXKSGzOZ+ijhHp1pHqW3erFkMftAWHknf78D6vHrs5n89sE4a4wUK/5NymmjUQV
O/nQMtZYBnPa0UWzbAqO30rITM4fkQ==
=JYSB
-----END PGP SIGNATURE-----

--=-kCF8cqPyfNvDUkkgv/n5--

