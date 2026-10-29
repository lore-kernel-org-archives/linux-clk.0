Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268721;
	b=VIqsybHJQIRf0B1mznBHYYH7z6b/XaKYngFZJxH3fdqL/AQlPiwLMJG/tJqoorb50HTK
	 QJO45MzbiHXD8UBG9qt62WBW3nUUmur2dRkjh6z77Njj2IgBMa3mySZJIizwLQTzX1Bmg
	 ksEZQJY116A3D1+MQwy0r6+JKc5UAmwAh47aDB7etshKNE/rp8cKqsbTXOY97umrY0EP6
	 d5JJXKAXsxU23cHppcBZ3nVYeQlFsOrl9CgYsXchNH+6pHUrmvTbjsWMYK1znuSiHlEXD
	 3/9m5zaIxZs1lWT1sroD7nw+82SN0TpQ9ZlOtH0EkYSc/kxn/buDAa8bVJk3GsoXCEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
	b=AyyDMBWGpGQwtmcc2yt3Xya2d++8eECdH6faQhRpWorpn61wHEtpWX38/qg+NlJZWi+B
	 M4HvvPHcrPv/UyWi/5uK5vEF+BDykkab7k44VFEFLS9iEaTXdc2ZiwpVmpyv5k9b7v0zB
	 yyaTXShBzWhoHf22X/oeILapLVJ2fLc3L/UlZFujBnYt/3gIuvgzvmdd5//ESPiy46bYp
	 o83JkWHn70OPDesRiS247K2N+DQrAUJTnqpntYKb1XPp2mIXMBkoJT7HS/gUNJ14n1J4M
	 R4xwkmtfYxFWxFYW1Bng/ld6I0GB+Aa9PdXB4HJawMJImMaSkH14TKOz1ElPnmZX90Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2sBbzu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0E4606A321
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 10:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB0E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2sBbzu2
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so4204816eec.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 03:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268720; cv=none;
        d=google.com; s=arc-20260327;
        b=SW+z4ADXbsmhp6j3yzq0wc8H08RLShNgYcO8D2EOwsgkARntdAtBtNu5YzfM0pRAep
         uumm7bde36gw85Gxski5EFXo7cfXg8lQmIVqLJQ04tBDvq6xyT4X8MKk8eLjSV9iNJt0
         qXTEdT1wBZG6Ns1E558KhWlaViZzFnePpf2ekTXNq9ri5fagEmCd65JplcO+trJh3dD6
         mtOvc+olKh/vCT/NifE8sJRuHOIYFxLcUYGtibC5QxijVsu1pvRsx+DgIKA0rjwDs6/p
         7XCxLocJIjRbb7YiiMxwtU0JB5BG502WNfda614W/GfmN+1oEP+OrHHggsC4hlgGZU5H
         9JsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        fh=jR6gZPGWDHj7DhUe+r5DSommXDGKngBpA/Y7zy0txoo=;
        b=FBkzEbRrEdByT1Wrruhz/eE4/ZHxUd5afXG3BrTBiFxgPcC2/IjqxCj7yYPPw2iQxA
         ISWCs889Qq3xjVDWeilxhRBjVmeKcoC9W7Vu7PuZfJyQsk5qVadMB/hFg1Ps5G1LM7By
         uPIf6lDm9TM5TKd7y25QZd/A5KFqfLln1UnPMgTU1e5j9AkRg0uGxwzdmwzj8u57qJfW
         lSy2ZxNXBp+JIs/p4DeiLC8JC1BXSUWXLpz53tdm2jSgD/2VGlB8SMBblijPqJky0ANv
         ezjWarxOJQic0IX51DLuqgDpvO0ujsXKrXxojQxvLMFcEwH0FBfFetQlr0GAqJNTIFK/
         lj5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268720; x=1793873520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        b=u2sBbzu2hkGqyQz96k0avHJnOd0ePQgrM+7rXIY5CaAiiyZJB7fbos+LVo4+Z+VJie
         mfAk52msiWbRDYHSp6K9F0r3vBVAu42VWJJcIswYAYEyddym4KipIWcJYlkp0v7JFUHa
         k3ysl41ONGLKIb+TkwkfXEuupnVYF5//5j061LJHXetcAlOvsUOPH6qQWPgEteyujjbk
         j5jaHwJArz0QdE8bFA4OOAr9Ey0Qm8lid05av05lDTQ9eH0RF0QJbM7I7Q/+KzxUNVQ7
         KpVI1eN/Yc8p8K+7W2df991+0sj/x6HGrbPlXbQCBSgjIoZCtd4sLnyYEm3nyAEBrykc
         JUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268720; x=1793873520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        b=R5uOag8IYQyIfQcOkXvzPvLbEQ3Nhwxgwkh7r2H+7Ohph7EkE9ueAKWINnSPuP0v/H
         0F8TBDPCjv9QBECOCkQji0OJ8FWKUKcq3NEkWaiHN1JGUW847orFd0zRUgLyZZ+otz/n
         HBPo/PRz+DOxtZYNP8ClIgY7iAFE0jCifXmyFMLTR+3ng33J2Ow/2Wp8cuCQt5mMs63M
         qdXifgOUN/2G3BlEZSmEx6CDgwD9M0AHlRC3SsDKTLCfttXWlRFPHn4pU8qFTcScqWtX
         2Vxx1wUQXEmXDuQ0NtDbcza5davINZqu+9RFk4hcxaPVzd3wNir49aD+AO7rtvZgGRbq
         Carw==
X-Forwarded-Encrypted: i=1; AKwUvBwuFG/Ry7gvUuBVu8hodgOlUCdgnyV69+wzFjVY+7HRgyjMc3Z1tvYr7E8xwGVrrlLTZMoHpfUti6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1So6gic6MjC5SVJMhBl2vbqUjNzGbDC9s67CTilFvRVhE4V9T
	uN4WbDkm+dNS2R2FEv+JZft1tvomIN6MmvHFEILwsvcn5r6VJFVTIZAOuWN3LeVvtKru++9zC0g
	XWb2ty5WVCTmpT7tliHbDX6olK/f3I/0=
X-Gm-Gg: AYBFou1nQdPcIo5BjdXNH4cTQ9QMLYB718qlnEblf59FUWnw3penNX5x9usR28bIrlA
	P9zFt/SWOLlyTlFG3OwZ2UfkNe8lSgKEovf1ogXtdVK+BO2HmVrBSWFUE0B5vZvxqe/Ew66Kywn
	+ISW7H+eeLp3oQ8vF09l9gLifcYj9U2s59QNkeXCL9lVZIS0YDRUdupp6hdIMARZIqC3ML4WNuQ
	a1j0fjiCpEB0CrkT0AE1aB4om6Klqs59LgR+8NKV7d6ZVeGUHHNux9Foxr6R/G6W4ke41NM+LHB
	sQv0ZQ+vh73Vy8TWVfYn+TXuEswukn9xuZD+4+YVlr/YU3Iqs2QH1eCTTNVTnqtndKhUDrr/bdn
	JbnXqqUPo9mOAs3NZsKt0+zXDOTJy1+3ao+05a1Pnu1E1ydjCiRB0Ieu2ZpXxlT/k/xT8WQ==
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id
 5a478bee46e88-36a20459a30mr7592769eec.22.1793268719830; Thu, 29 Oct 2026
 03:11:59 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-upstream-speedo-t114-v1-0-81457cc9d94c@tsv-stahl-riesa.de>
 <20261029-upstream-speedo-t114-v1-2-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-2-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:11:47 +0200
X-Gm-Features: AclHuK8mutFrWjpw6_PPdHUAyItvpAhM72OsxTaC6ggH-p4KNaOHRql6Fdiss_A
Message-ID: <CAPVz0n3TSeed-SgBbvsXtPJtx5CGzuYcruqOiKVaijBu2w+HVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc/tegra: fuse: Store Tegra114 CPU and SoC speedo values
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> The Tegra114 CPU DFLL computes its OPP voltages from the CVB tables
> added in commit 5aba939e80f4 ("clk: tegra: dfll: Add CVB tables for
> Tegra114"), using tegra_sku_info.cpu_speedo_value. The Tegra114 speedo
> code computes this value but never stores it, so the DFLL uses speedo
> 0 and only the c0 coefficient remains. For CPU speedo IDs 1 to 3 c0 is
> 2190643 to 3395401, so "mv * 1000" in round_cvb_voltage() overflows and
> the OPP voltages are wrong.
>
> This is currently hidden by a zero voltage step with Palmas regulators,
> fixed in the next patch. With both fixes the CPU OPPs range from 1000 mV
> to 1270 mV on a device with CPU speedo 1742, which matches the vendor
> kernel.
>
> Store the SoC speedo value as well, as Tegra124 and Tegra210 do.
>
> Fixes: 5aba939e80f4 ("clk: tegra: dfll: Add CVB tables for Tegra114")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra114.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra114.c b/drivers/soc/tegra=
/fuse/speedo-tegra114.c
> index 1e6c2b5be759..8bf1a1b1287a 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra114.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra114.c
> @@ -92,6 +92,9 @@ void __init tegra114_init_speedo_data(struct tegra_sku_=
info *sku_info)
>         cpu_speedo_val =3D tegra_fuse_read_early(FUSE_CPU_SPEEDO_1) + 102=
4;
>         soc_speedo_val =3D tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
>
> +       sku_info->cpu_speedo_value =3D cpu_speedo_val;
> +       sku_info->soc_speedo_value =3D soc_speedo_val;
> +
>         for (i =3D 0; i < CPU_PROCESS_CORNERS; i++)
>                 if (cpu_speedo_val < cpu_process_speedos[threshold][i])
>                         break;
>
> --
> 2.56.0
>

Thanks!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
