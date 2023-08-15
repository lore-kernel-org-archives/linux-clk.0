Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A39C001DB
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 12:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbjHOMem (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 08:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237296AbjHOMeZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 08:34:25 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9036B1BFC
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 05:34:17 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bba9539a23so9334985ad.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 05:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692102857; x=1692707657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zk0lnGhprvEGlSleYfGFckTbhrw9mqmrEwZ0S07D1AI=;
        b=kC98k5CImyUk5AFWRwN8XQvSmADBnce4TpelNV/2ZcoMYMEuQJO2vRDTMOQ2MyqKjp
         YB5jTx+v+VB0nZ5O3zqrtB+370WUe6ZvHLI1pCjfPyTToWiBHt3GmLDtktZxe0+gK99K
         d5zzEFC4m0I5fVTfuNRfOIWc0Cq7VOmXYsThd3vN54WA89MGzH/ONB9On+1Q5akq9uEo
         tA6J7l9FWUUgJvzVttMl7ifWbJCx+49410t8Gi4jalRNlyQ+Qzc3E5DL0AO1+M+KuANP
         xcf6iLvQRZce6iyLCSZvo/exkm3pGS7PNVGsJaLi5mXRUc8R04Z88psiXZay3CZtstLp
         qB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692102857; x=1692707657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zk0lnGhprvEGlSleYfGFckTbhrw9mqmrEwZ0S07D1AI=;
        b=B5q6dJuVyfUucohRj59hR2HTXRfYB1SrF2iWmjiIqurDjnuYxJ/AB8JsB1rL3SggH+
         WBU8uxxWZe1kAfkRUQBXB2Xa/nE2D4JSbCCYVlpZCovg3FDm106enZoLlmpR9e1WU0vi
         U2e3gF7ldhb9XLfBmQknS99U6BqkQKoMPF81PtODi1ZFi4pnNmOgx1MkUy+1lzvqNB7s
         EAhyH7a6GAA2HgXeIAxAgT4iz1Ab2eJz1IgSkTdz0EDRdf2gbvLGKU7lYDx9sEtSru0+
         /f3gpk2fjWn4BKaCk70Z29Bk5h1LAhQuq1TComaTA+FnU+rarXIKa87xtbpQ3XQsojge
         oztw==
X-Gm-Message-State: AOJu0YxLKouF4QjbLJxCrRiLkTul6P2ne/0VKS53QVhl35YYPUGZTwVZ
        E4fsXAKIbTNEtbCIKQkKRrf/GzE2xl6b66fDZw0=
X-Google-Smtp-Source: AGHT+IHFOAmOMIpPmNX/IEz23Ipkz7ealq+Qrkaj0oGKePIOQXw0XQHkyVN69URzOzbshFInwJLDtybcy6KDts5O2N4=
X-Received: by 2002:a17:902:e5c8:b0:1bb:83ec:832 with SMTP id
 u8-20020a170902e5c800b001bb83ec0832mr14358341plf.2.1692102856862; Tue, 15 Aug
 2023 05:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230712115301.690714-1-festevam@gmail.com> <20230712115301.690714-3-festevam@gmail.com>
In-Reply-To: <20230712115301.690714-3-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Aug 2023 09:34:04 -0300
Message-ID: <CAOMZO5BtUCW=PeictOBfX5F5PL=M-+jqsD3xB7SAKmU6Wy5Vzg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: imx: imx6sx: Remove hardcoded LCDIF1 parent
To:     shawnguo@kernel.org, abelvesa@kernel.org
Cc:     hs@denx.de, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Abel,

On Wed, Jul 12, 2023 at 8:53=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> It is not a good idea to hardcode the LCDIF1 parent inside the
> clock driver because some users may want to use a different clock
> parent for LCDIF1. One of the reasons could be related to EMI tests.
>
> Remove the harcoded LCDIF1 parent as this is better described via
> devicetree.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Rebased against 6.5-rc1.

Shawn has already applied patches 1/3 and 2/3.

Could this one go via your tree, please?
