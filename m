Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6603FC7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjB0Rrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjB0Rro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:47:44 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBC221A20;
        Mon, 27 Feb 2023 09:47:33 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so6408705pjg.4;
        Mon, 27 Feb 2023 09:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEIvbx4ZdYjqCosyjhJqi4vKMGPZUq/SADY/4xXB96M=;
        b=Qw8i1zcjqFBmGlZz9/bzbPdrsH0ZS7cIod6W9WzaXzTFtG5aeV/3Vasdf8FCArTSQ6
         Gf5A4SBzUUzK2DkKKsWSzSAPJ7TEqDo7S3Qo2ZItN+3OgjPNqb7BbT7kBRG9gaJpyqPn
         sRJUkRukDEI/O3I9NgTzqh+o3iMFqm2iIf2jNXGZJO1brZp9+ud9IsgJisuyGuO9zYbB
         Slyo1tIoQ44yFu08SbxpsppIi07JX7Ak4xH4aq56nhc42FMfzVY0vHskFi6TnidXToeI
         dLsQKX7J7tOQOgnoJ2QpAzwPCV86oEKg6CnmRjOS+/f8IgcWr01bMQNJMvllxPcQUHC4
         tsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEIvbx4ZdYjqCosyjhJqi4vKMGPZUq/SADY/4xXB96M=;
        b=XVOSTwyE1/w0+0bJM9VdEzolp7XFhWS4pz5gzguvDImXgck/UAWKkgEVHMsSp4ybWH
         imqk88rnodQZKgj8XjusYTVFGjhrBIrl0k41bnNMQM1dl17KU4dNkof167VYMRRC9zSZ
         J/rC0EGIRLo/aFL6UhpleWzpVYICN+lWx6IK/3MOsmGOQSWdyUOP+6LGTjvWTuZK0doq
         ECmHf0kzmQBeaEpe+g18X9tQb5DN9KpZr4VsjJs6bM1kojFjofBjEBy0LMUNzAPEESxe
         aoLJOlmhg8McSRD/mHqz2PAS3jFhWlTBmcC5TBocPeedn+flQHlxS5iZH3gBwPzrdhIo
         KTdg==
X-Gm-Message-State: AO0yUKXF9C/HluVWb7oYXf9WZKroeSPWRjZOL3TfqCzuvBuN3vZ0K8nI
        CF7lD9q7UxGig/rffnaAO7flg8koRa4mxpbuzbc=
X-Google-Smtp-Source: AK7set+qtmEv6OxeiaxCEtcE7lOFSYIbt4WtlRaBwECyK/RuXas4VBOofuOOyN56GQ8e+Sz5cKUVmAHZ0SGle5NakdA=
X-Received: by 2002:a17:902:c3cd:b0:19c:a3be:a4f3 with SMTP id
 j13-20020a170902c3cd00b0019ca3bea4f3mr5701398plj.4.1677520053123; Mon, 27 Feb
 2023 09:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20230227174308.87286-1-marex@denx.de> <20230227174308.87286-3-marex@denx.de>
In-Reply-To: <20230227174308.87286-3-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 Feb 2023 14:47:20 -0300
Message-ID: <CAOMZO5BBhb71PZkupiz+3-GHEkm15OXTg+R4-bpneoGaER+b-Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: imx8mp: Add audiomix block control
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 27, 2023 at 2:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Add DT bindings for this IP.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
