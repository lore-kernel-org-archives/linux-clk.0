Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205B42EEA3
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344108; cv=pass; b=ZA3jfhtRsWMQwZoCJgveetwr1HTxsygAcOdxAcIdlt39xphEHD+YUHtDa0tGUuGeV6VISE/M4KagOca3OwUW6UaWb8vlclymmjk8eFXlXwB1uaadkM45kk/6iRLwH8d2r36nbz3x9GOGzOeT2VGd2vUU5N2+wLOXRRVSwbPK9ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344108; c=relaxed/simple;
	bh=+bwQPpHd95uc6Rg/Dz4vte+4kd/r1X1rT7qjY6B28Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3yI21alL60ybzfMXRHzrbORLpqlxHCV4aTrVOwAsNYjhRMy0GSJ/51ecubNYwu7+fJ8KfnqrGGgZZ7t6xVvh0cTgdmGbSHYg0FTkIinp8xRu89PBl5bicxYYFXbWM+c6rMSNystwQlBwGaku9m1IK/SWASi3PgyMSk+wG7Hddo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=i99grU1/; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="i99grU1/"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66e63c2c9e1so2344067d50.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788344103; cv=none;
        d=google.com; s=arc-20260327;
        b=nCAfRl4cwxgHUAQJch5dDFKZtPBuJVk6IxWkAtow6ty1pfOwyG9PYVGi+h2VIqs9vW
         675+QS6U9wS1W9WxjCHYq/7/d9vG44rhkMJUyyUv+1T2XSI2678p71srsvOJXZWRGk+o
         kvPyVni3LgyGqy6hV3chVvntIRMAAiW80w1YoeEzdF1RRJxocbIhYXorEX/cXO/12Nyw
         9mRq/gJ1o5vzdvXHGyXC7onVeLQ6dLL4e7PkM/6XhocS9AYviS9tCLGxgXZNiNSsLKIF
         GaBw9ZcSPgAn7Iq6bYm3KwzfUmSqUAPEoOuDB4OUCVsIFEVUYsdJtMWRWkKvW7PLpLdg
         W9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mb8ynk069k+PNmY0VezYYz4qwV9n0kB2tXPfvCPTmTM=;
        fh=PWMv546juH3pNSiNVCRzIlrtlDoiHLSGa8xJitRz9jM=;
        b=lskSCRULh2caPTxolgsIN2pSME5PB2ZS2iWuwPQ4RQK7SOvoyu99lmnT0uUERMNtLq
         2OJ2TNaOi35on2AMub7mvc4mbJzo+9GzW/SwtyoZdu3oKQYSUDpuQ8Xb5lw8tdi2oIYb
         RMEgN7TkCeFK1+yiG15nP3uBrJxrwPLkcs1v3jdOZoWpEeJURIzGNZSaBHTLuHl+QLMh
         Zv0eiGr3lq2XouBt+d6bnbEIelzDwCSIy/92d+990VHLZYpSvWCuxdB89l1L0mfIChgE
         O1uhAIMpgXuI5eO0LmfI0q8sanWBZxWcYCLhoSAyfnVongwR/Ui3f5+UPPEdABri9BsM
         olgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344103; x=1788948903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mb8ynk069k+PNmY0VezYYz4qwV9n0kB2tXPfvCPTmTM=;
        b=i99grU1/kN9GIudkQwXwB3IAgY9JLaSgVRSXmGE09JVjS84OYQAF6bWiXHFsK6xcmj
         Oms+D4o23ToYn0MyPRpWodA6stnarHodS3F5QhAhszSvt4OUt5N7dU9rJO4rMnn+z9rA
         NqnGjYl849gEGLAkcdcPrR4ngITFA1vfF/KYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344103; x=1788948903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mb8ynk069k+PNmY0VezYYz4qwV9n0kB2tXPfvCPTmTM=;
        b=bY10ieekGHE7gXAOAmdbrdrLo3IrPCSgeO++BQw8DZDlgUj8OMU0MuqmW0o6wlZYUm
         AbWblr3y8SKmqXviY9FziMYF0YGpRJN/4MpjJMSFjOqQ8juF4bvESXTwc0PfBfrtfCcJ
         VAXQg5+QeFrZTGs9298iOwQfF+bLkywr0N4Cqp3wJ41Tyz0tRgtEmR764+TQW55mh0/J
         irJf3ORxV9wS9AIt57Fo94+asqhfW5CuH1t9lMpacOtyDUNzf2E6WInywaSKUpD2b5X8
         h/KxBbRUGV7enRUP4Iv65rD2a/RvFOAFAfYf3wzjYOS5hqTHGkvc6B/qF5I6tuw3PkCp
         WzMg==
X-Forwarded-Encrypted: i=1; AKwUvBwOjrMOcf8ZIjjaYDD+Au6Y+uL0M1Lg+Ne+Pku8EubMZUYpBDxiUKtlSLMg5jFPmKiUGMAwm+39joM=@vger.kernel.org
X-Gm-Message-State: AFuF++kwgHloUlxZUcb0eDjlU381l3BVRqnnWJ9B2Cf/8yWM6VMWWNsj
	uk4t83UTcqi988/cmHuJqYHOMLYzagvJr6T925zWlI8YrhLu7D3oLVzCYHwYuFu/k5XJY1jmkB2
	a7D+3oXDBU0MGZmnUGdFzQkzF8mm3lFBUn3ZcDGJsBQ==
X-Gm-Gg: AYBFou1JCordNYJOiPd6li8J0PnTACtF/CZ7EwZ0GuJzJAbuHSso50ENYR27I9cvdQz
	Liow4TfhVA7Rci/fMmP3U/ZvQjBDpr77Hypn+2vdh1RkWbyGvGDjWFFhtfSJigByY8pDC2C/g2j
	ozKWAoA30uREQNe5MyYB/+2UoHrsOEZmLHL9b8EOG6Rb0y2jXzUCCbOpqGObnqNhXiyaWCxKVPr
	6/72HOIqHGE7i00OAgniaTOLLgbcopTVK1pEp/1+Vw9IwLic1043tov6E+hblaWl6DM3wbA1qK8
	kyyffM+1mLefuCATtj4XlfxbC9cWd2XbMAFJlvdY7ZnhOKs03rpYCvij/CjciwaOZMbxNIDD/jQ
	=
X-Received: by 2002:a05:690e:4811:b0:66e:3f5e:d9d with SMTP id
 956f58d0204a3-66f8a55908cmr3215408d50.24.1788344097702; Wed, 02 Sep 2026
 03:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
 <20260901090912.585681-2-dario.binacchi@amarulasolutions.com> <apfgacuyUC96x44N@shlinux89>
In-Reply-To: <apfgacuyUC96x44N@shlinux89>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 2 Sep 2026 12:14:46 +0200
X-Gm-Features: AcwNN1W0QxIzImRfwuJO50vyXAICPLdqq5UEUTh9rGTZ5udrdp2AiyHjRSLvxL0
Message-ID: <CABGWkvq+Fqn2AVG3UyUVuK=styz7F5bwu9zdZtAV0HTGES6vNA@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] clk: validate spread spectrum configuration
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Wed, Sep 2, 2026 at 10:33=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Tue, Sep 01, 2026 at 11:05:17AM +0200, Dario Binacchi wrote:
> >The spread spectrum configuration is passed to the provider's
> >set_spread_spectrum() callback without any validation, as clk-conf.c
> >only skips all-zero triplets from "assigned-clock-sscs". An invalid
> >device tree can hand providers a zero modulation frequency or a spread
> >ratio above 100%, and each provider would have to add the same checks
> >to protect e.g. divisions in its rate computations.
> >
> >Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >---
> >
> >(no changes since v1)
> >
> > drivers/clk/clk.c | 14 ++++++++++++++
> > 1 file changed, 14 insertions(+)
> >
> >diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >index fef87167a60b..208caf60eeb5 100644
> >--- a/drivers/clk/clk.c
> >+++ b/drivers/clk/clk.c
> >@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw,=
 const struct clk_spread_spectr
> >       if (!hw)
> >               return 0;
> >
> >+      switch (ss_conf->method) {
> >+      case CLK_SPREAD_NO:
> >+              break;
> >+      case CLK_SPREAD_CENTER:
> >+      case CLK_SPREAD_UP:
> >+      case CLK_SPREAD_DOWN:
> >+              if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
> >+                  ss_conf->spread_bp > 10000)
> >+                      return -EINVAL;
>
> I think sashiko comment is wrong.
> In [1], we reached an agreement that spread "in permyriad, i.e. 0.01%".
> So the input value must be the real value * 10000, saying 0.01% * 10000

The DT cell is a u32 holding the integer permyriad value, i.e. the
ratio * 10000 as agreed in [1]: 1% is written as 100, 100% as 10000.
extConfigValue[7:0] takes an integer percentage, so the conversion
is a division by 100, not by 10000:

  depth   DT value   / 10000   / 100
  0.1%        10         0        0
  1%         100         0        1
  3%         300         0        3
  100%     10000         1      100

With integer arithmetic the current code programs 0% for any depth
below 100%. I am sending the fix as the first patch of v12.

[1] https://github.com/devicetree-org/dt-schema/pull/154

Thanks and regards,
Dario
>
> [1] https://github.com/devicetree-org/dt-schema/pull/154
>
> Regards
> Peng
>
> >+              break;
> >+      default:
> >+              return -EINVAL;
> >+      }
> >+
> >       core =3D hw->core;
> >
> >       clk_prepare_lock();
> >--
> >2.43.0
> >
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
