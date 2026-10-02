Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8545361DCB
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967137; cv=none; b=CNZgGMWux1RLuySFxaqP2o3An7NKNRxZ6KqW/InL5kh+f6ZmpTbt5zf7XtzZXl3GH66REqaZBXiepoKBbo2iP8DTYRS3mfXGh+DBi8+WlAJnRBGcg4ldVVmtgI+Vxoi2/e19vr98TUuCvaDymNkGRj26gqb+QsCKD9ATmeMl+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967137; c=relaxed/simple;
	bh=d+7Dzq3mPeyFPY32y86AvdtMGs9/cR+SwwsFl7j1jgU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CwDTbNYP4bXYJQ1tqAJqBKnFQmEA9DSvrL65r938rgpHj5kybwvmsgsGtwqrOV/au3/yyZnL6cjIf1Cx4/BoZYR/iPE94Qeks2Da4DZvHlvffBZWFeLptmqmlWpqIlPwuvG91Oi7hcCwUjhvKl1e4sBykWaIjl7BD7Y37pmzIBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HuGmaO/o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mBI6+CaK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HuGmaO/o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mBI6+CaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
	b=HuGmaO/o9vKa496/1RyoY0obRUI20MtNMpCaJAuxSydQfiEWDxwFtoh4z7IgZqcIgp9SZv
	3cwoGbYBSGT2ZyR1Sk8shpZfnHP6+KYrvY/TWozQE9xen09EBkwyHq7apyLNN3XEDE1M8e
	1iWY05iuKJhK3Qevh5otCn34d5olaN4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-PTe2WI5SNZmkgFxer0RVQA-1; Fri, 02 Oct 2026 14:51:57 -0400
X-MC-Unique: PTe2WI5SNZmkgFxer0RVQA-1
X-Mimecast-MFC-AGG-ID: PTe2WI5SNZmkgFxer0RVQA_1790967117
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso368933585a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967117; x=1791571917; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
        b=mBI6+CaK0VPmeI3cVu1PU3PD7RbV1HuhM4Ec9Ey+94hWHhmQ/efAt93x0359oUESUh
         o84iWcn2UKdw5BxVdjoZgOTbHoSEJvER33KkdVG9NliIsdF/mye6DY69YecSZctayYiF
         NyGExUQuSOycgO6SjwC3BJ3YJD4c3EzNED8RC4kUbU+lmTrS2ATY1LmulOlxCB6nqVqZ
         NgJ+BQ2y7+q0X/8rX//TRIcox77mTBRYF/dEXkwuCXlv/b6Vt5PoGPffIJfnkiU3F7IR
         Y0zp2pYYeTJJ95af7Rf6GvehD/APSgbDgfh5KzK3R1662lO/lyIT9mzEAe/Ir70TKZC4
         mItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967117; x=1791571917;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
        b=ABZr3qgOxQ/eQRY2IRU4CbSyaAj7FAKaexvPzqIufbaV5zlgxdfyH7l52u5BWRRDF1
         rV68/V50qocLWvVv2431xSxV61bJS2s0szQFmuPdL5btakvaK8flVn3/IjKrsLZIoq7T
         4sVEcA6YradPGdv9+NcuoXTFZBNP2ekjCZksswfdTb8V2e+JECQwHCICJPcVDwxg3pn4
         qujOofWvaYGyo4g42dJKJaHMHifb0x/x6km947UtA2W8a3J4V1mfJY5zChFgUVwRKEcx
         nnJXMTcNl3hO/kLzIJQ0B5/TqiLpp1N+aJlnB6j5oCUOI+7Bc4y45ra6jiXupezlt3DN
         xQkg==
X-Forwarded-Encrypted: i=1; AKwUvBz8/CHd9tiaXd2b/FoyPBTjnNoefUvmkFD1vRr5Tx8c8hqc53vsBDRngwJeFAecEldcsVAhuF+sP+o=@vger.kernel.org
X-Gm-Message-State: AFuF++nvE4Irfj7ZMBIQ38QOblTFD6d2cY4hy5UGGbZ0e1nGwnl0KalR
	762dC1ZcF0mwr/3Rs1Oe5SazRJMfHBJlPvzxPBG1SmoNh0W9uxull2w0iyIUY6ExekXRmJieSov
	O6P4IgLZkD9naZSK/tBMWh9JiDofkwN+8i3cNTbD7jN4rBGNS0abFNI/q4Gp7/60Dpla/iA==
X-Gm-Gg: AYBFou2YJCN4iTyhYaJ2n2YINeX3nqzBT0GESomP2fyZnwRFDD999AHRzu5Tx46MeVp
	/V8fTQFz82Ui8rCgbxzH7PmVZogErYEOfBYLVHZSQOrRLaNxbiJU7ylMFKCwsduG18i1WbNzQEp
	xjhOgQlotXzgEIK/Sss0zvYs/93qjAUhQmIWqJchcCO8mY0gsiPTDmUMF8brni1bQnr+tOU2O0p
	vUVf2nJ7j2ZaFOJQzxm2VKMFpQiCdYwcbF1FnvsN6+//hGaKqAEc/hTSYw11+JhwUphV2Ak46n0
	zKlpvSg900H8Njfh2pEYttBajrW2ZlMVJ+7yWiRqoq5uaEDrqk+Z1JcjOlYMAuOXBHjOlEHHn2v
	7ClOHIln5r3s/hw==
X-Received: by 2002:a05:620a:7105:b0:93a:824:ac8d with SMTP id af79cd13be357-93e5102406amr48501985a.27.1790967116810;
        Fri, 02 Oct 2026 11:51:56 -0700 (PDT)
X-Received: by 2002:a05:620a:7105:b0:93a:824:ac8d with SMTP id af79cd13be357-93e5102406amr48495985a.27.1790967116138;
        Fri, 02 Oct 2026 11:51:56 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 11/23] dt-bindings: clock: Add StarFive JHB100
 Peripheral-0 clock and reset generator
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-12-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-12-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707365.821688.14329539857628581125.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=d+7Dzq3mPeyFPY32y86AvdtMGs9/cR+SwwsFl7j1jgU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7Wx/KcQOOltnNfPrdMX3LuT/HC+0e60NpG6lD1rZ
 17q/rvbvKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ/DvF8JvNMflnwRuHRRt/
 inec9nG6u3qLz7SmebNcL5042au9L+cTw28Wm8MCxyYbZ0apt67dn7TKUV08XMTt6JZbavvlIy/
 UbmYAAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> Add bindings for the Peripheral-0 clock and reset generator (PER0CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml b/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> new file mode 100644
> index 000000000000..db43e03fd60c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jhb100-per0crg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Peripheral-0 Clock and Reset Generator
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jhb100-per0crg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (25 MHz)
> +      - description: PLL6
> +      - description: Configure 400MHz
> +      - description: Configure 800MHZ

There's a mismatch here in the casing of the units. One line has MHz and
the other has MHZ.

Brian

-- 
Brian Masney <bmasney@redhat.com>

