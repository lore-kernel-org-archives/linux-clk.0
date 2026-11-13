Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567776;
	b=aabIX4M0AWPOYRHJj+iDs8bkGKblXJxgOJSjj2jUf5LUrY0FqiyLy2z8AJuBHREDxtZ8
	 G90aQfe23wtb+vlmkT00tDacMm9fd/8mKM3VnMMb84BERRbIo/bQf5D5x/rhOUvLUsG3d
	 1rFLlMxJaNCutkCmSDLgIIatTKE1f3WWHOk27PqMHCWRgcM77b0gr2g9R/qDUfYW9GcDP
	 zGtA1NyqGyaDpglyL/FHNtf4prWDBs6h3VWZ8QfrtWoVaBigJ0PTiOCC2ql+Njl3ABbkB
	 7361XJpAsk6DqPHfW8I2jagD+MNbtdhKoEB37ZdlTBTjbquRmfkcYG09FTAgzJuHhVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
	b=Ic5oWTGHUaCUEqlSwdYYLvy7UhtbjJMqFmTjx+xBoTao4gyVZKRDvckitIBve881spKR
	 Zo+S2Svzb08ZD13anNc0e2XXp77HKc+GuXBjiPBDEAxfvVReSOI6+ukYL7DRE2H8DMLBA
	 qJ6QZ5R08Ct+c+QmjQRvl5qbLU0I0j2l7SGuWqpgkluShj8A0GDhMd+ty8egTnJU4MKru
	 apq549rwV+y0DM2lPNuOMvtosuu1toTxA9GoqkIaP+8arf3mW9swh0cI6wMuVQdVf9q58
	 +4YyoLp8JbVYydScb+cgkOOWn6Z0FRqk3+RQsvIECHwo/fQRsgXNOkGh5jOfdBXHB2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C4606B24C
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920C4606B24C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1194686a12.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567775; cv=none;
        d=google.com; s=arc-20260327;
        b=AvIqZT3sl1sWAPJPhQJZ7I/5dmMI4shnZekaEkJxlFqz3vL/UhnJNuGXZJqy4Vtjau
         jAE4k011Tn411FI9LbJh6Ja6TV+zhPYSQ0kkFffVGnTSUXyxPtHBbg1TuYc1GdrBvVT0
         RgZUeu+qMbvfVPP7jPcCka8TMRDzI2y/GoiWgFIgSF3xwu7f5JibyWK1rMqdEaFMyqzd
         2xurTWX6ZtHyMypTgUakV7GwIbV6UZozk+mlRAfIXUhNzzunEQ2EflWZSJYC2uW4KJX1
         bG2iG179aGNJFbCpWa22PJpX8FNjbjE5uCJbJyYlPnzVfJg7E4l+vCxVY/2Q3aNdfTzT
         xOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        fh=S4gI3EKQpb3cbo5v800NwqEddccnKWrouMf09YT/Ka8=;
        b=YYvGRahbUZQffRPZIUCVQai1kT7lbUIeUOEYbTXmexGPbeT2YM7rEv7A5Q46V/dJTg
         49zA7g/SdfBrCDE489nW5G2PX1Y0D2hJ+fClnnWm315/V2mehEbQfGOfiTbQwt7T0rK5
         qX7roAzPp++hnltkpB2dt5EWcN9bT6SFWUwYZrqvJGheS2BYqxvL9/pnpmAgreERM3IS
         orMtsFabLgxIx2mklOG6CmrabHjSQYQCW6bvKCSRb+37jLqrGKNxk0Uv2dbAnZl5fJxb
         oWko4X0nVZ+nY08wgqEs34ZvL0TV/VyUxgm6FhA4kPNAsvaxf8Jso15GvreWeZ+Feoef
         M+gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567775; x=1795172575; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=JwUO2hvV/ppxAEDkH/xdfzNFsOCy2nUrg0ZFHAtKdpe5gps/G6RPPA9pKq4aXnNwly
         oZhmwpq0Z3TSi2r4/g1eyDRmUf3WQvjKa86mjB0TvIGOiRuPPhYk5/+RymLXdtEiTIS8
         JvVaSLafA6RqJmAQEKd0fDEeXldwwMvY1Em98dMSnjvSFnsUBfkDluLri3+1fuvzDjjL
         XW4z+VHppZGjccnha4auuROdpE2ZV91UQ64JVsjuUS1y4ELJ/ZKX5hkWFlllr0XG+/JY
         eEA1IcCu69ZJOzG7zBmGhpMqzl/UXCVWflfmtyvaRXbDhmk0hR2dQnoMjqg0uBKiJOV+
         SJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567775; x=1795172575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=JYKsR5yttx0jFNwBsf/XUWBFLdmDZHKQhwqBNaCt+tnxKBw0HYw8Oy676ijR9/zAu2
         q5yIOYMTogVGLgw/oX0zZf6gSDFprLob/WV6UhnsX7nNWNm4Ky85jLYyfeEobawUBdOJ
         rOk7hScxOH6PcWU7N0m9BLjltaBmTTDeU6DVggyT784LA1cgdPzre9izRLbX7cGqlBGX
         jvC9mLg4EwQpCkGpQY3aw2gep0WTdlip7p1QsGYMTEhUV9Lsaxh18C4YjrhZdycYKOfk
         yzoM2HB/97nuFk9EIR6hsiwTz2HKTY1H1Xqs4a3SQ7xZ1vPBYu+G9yYMw8GtNgaRiab4
         s5Pg==
X-Forwarded-Encrypted: i=1; AL+hErHe9W5DBEkNEEtqoUMCoqGb8n2kQdF4wSjeConcO7Uj8qxOCCD8TbGAn13N4FsbHwFFvpOFmGTCqvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UPvqXcLUESqIRf3jSQ48qLk46XuSd9qvdkxqtgCk1koaEqDQ6
	oEugsht60EIWTDoarL98m2+zrFubmv/wmmRnSv6CS6JzmRQCwWMk2RyA08XXKaSvYDCj/Rcyv/2
	izGOZrhVa5WlR2Q4oxLVya/B9thyQWRY+yctoUUZDjA==
X-Gm-Gg: AYBFou2att+qdIAy0dCl/p9rTKlyEPVUX6aMeHxiE1F01Ec8LtBqjNlDALVINx5hncZ
	sW77QztWbrPfzNgxlmuE9MLangxssYpPa9tedFKQ9RGoXzb3ywV8J8TTkMXqrGOVONy1LOX7dgd
	amTzbJRhNqarYELa7a+ngQARGR0kadAyBQC41iEIFacNUbCwCmYMKS3M8v+OYA7SAiXEYGcDw4I
	/ccz//FgMBHQJ6nC0vcaUmkxcpxempRiUhKOUtBxC12a7CVfoFo8Ea8UUwLwzJfgvJ4KMo/074N
	AHiP+iWnHrxyc70J3RRQW/VBnz6iAk5wyO8NwS6WJpsmqfje4TyxDbCqtNH+etOFIlkZwvaXPvr
	liak4Bg3KGMBBs2RhtqQ8TMSYPOHS4L9L7Qgs6dDxsDObDjE9EyxWlgwsfF8YNjVa7wgeSQ==
X-Received: by 2002:a05:6402:13d1:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6b7c0c7fbb1mr1715682a12.36.1794567774860; Fri, 13 Nov 2026
 03:02:54 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:02:43 +0000
X-Gm-Features: AclHuK-cUPGFMqYQ4aV0p1o7MZtl5WXavbyl1lomUd6smnM_F6LSvDHUWLAhm10
Message-ID: <CADrjBPq0nD1ENZySUVZvG8gWGpYrf1464MMau9VswjfosHU6Wg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_HSI
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 53fc8040e173..21928235d131 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -28,6 +28,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,exynos8855-cmu-hsi
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> @@ -52,6 +53,26 @@ properties:
>        Phandle to system registers interface.
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-hsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_HSI NOC clock (from CMU_TOP)
> +            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: ufs_embd
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 5d8b38a744b5..67cd97d8fab8 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -214,4 +214,12 @@
>  #define CLK_GOUT_WDT0_PERIS                8
>  #define CLK_GOUT_WDT1_PERIS                9
>
> +/* CMU_HSI */
> +#define CLK_MOUT_HSI_NOC_USER              1
> +#define CLK_MOUT_HSI_UFS_EMBD_USER         2
> +#define CLK_GOUT_CMU_HSI                   3
> +#define CLK_GOUT_SYSREG_HSI                4
> +#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
> +#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>
