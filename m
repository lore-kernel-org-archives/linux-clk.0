Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357342;
	b=QEneKz37Rrq3OUZi9OSYmVR0AeotNeYcdnwNR81YxnPjAjimo84C2Os1EIPFiCD9VGa4
	 ycux0/oPmp93cHBy5sFdoBFtcjuVCq6EdCjWwsQ1BLxgZLdvmXxSfp+xUDmGxYjL/kECn
	 J84TG5zPxdHPtuq9Rza+m59HIvBOOAKQClroNfYO6VrfsZ/zhbNutRBlVqKNvFReDQxjR
	 zaEpGFqHTWNk1Yxn70QrH+9u30hbi+yYgOkgASOQl19bFNu+z6XbdmVtzBjUl/dSo0Cao
	 yJQZ6Zbkf+spB38IW2Qe98i1CDLBAxhvRzQ6b+RFTXwJqrwcgcHWBhV76LBhIIPnv3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=eiIcyO7P81OBEHA4Sw3zY+ZokoYOfQKU6S8YPtjREDk=;
	b=IzRKMEwNM03EuUFe95PIYiSUplhH6+Eu0l6mt2FQJB+0547qCvnmiMOkkcNMj4dHsCc+
	 uWduJC0+0y3nTDbiJe5Ovaj7BAgUoteNEGFRHDN57mjw+kSZE9dGJs0Ew/VxbcJi5jW6z
	 gNJDTbN4HxJMQluCktcY1BSm2ja3Cjnwb2LiTbCKX0tGOzeWI9Jcq0FYckBIPvV/ltCF/
	 SMdHxJ1zg5vwOc8FJTG9UZaS1Bm6DwmG3kGjtpCMttejlssREpmuyzfmIl9BinlytXpMq
	 rCBrqrBqkrgShI5yYGV8JRkngjxyDa93vDs2zQNi4c9FGDPKoxjWwj54upNNLCsyjHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Akpizang;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76660A263D
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 10:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF76660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Akpizang
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso297010f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793357340; x=1793962140; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiIcyO7P81OBEHA4Sw3zY+ZokoYOfQKU6S8YPtjREDk=;
        b=AkpizangxpGL2FKTdTdqIyT5JGwdLcPlyohrInXtHrNQEE8Vu9y7cydRvZTfyWS9aB
         CrM4Laa3WmIAX/tb2vi3MM8k0UHGiOLvbi+tgzOy+hJHZ6NvSbIrlr7RP1St1FHWjoue
         YfxT3LXqtNBE/q8i5mI4mJyqAwvkF+O9+54M2KLHVs0qEI1wLU6yHyRouIUfQbFCZeQh
         olY2KDbzx0O3w9sjghy/TXjxRzywqCY/EWaTAMJrvHrCbILo+aKL/SmJQtOkA3zCLVya
         8ZOnh+9dJ3Y3y5wZkxTTbtZhB74FjaZPnViLNYLFB+NYdzb9D3najyQOlEcdX/OR+UWI
         SAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357340; x=1793962140;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiIcyO7P81OBEHA4Sw3zY+ZokoYOfQKU6S8YPtjREDk=;
        b=rooy9TdD9Q7cRdOBu/wASSTqdNmbMXsSatb8zTBGVjiqMWxlKMJfHSthXGnY6eOq6a
         6t2JQGQwQWTcawfGcdf16StRJmdipyJ/NS2DOwojVQARUARIk9G8VYHFJE7ZXUqPAhz1
         aFVH2CWIAtg7M9qB0VJO8kMGZkmno0zkeL/KXFprIh7lGOqMCNq+KmEcA/hcBs/dDllH
         EUXKlndaJJj3+hJd7HjzdnMrNgcu5+RgJfRN/63MfTX5nz62KBMb6dQu9GH6m+JeqDRJ
         vRI5/Y3/8XL093+RkQUgqhGrs0eFmhzvN18WatUoMLB+s7o0dm5OO+Jt908pvZIUW/dM
         34vQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0sKtXRJ4taKa/tm23un6XO3wHlgNvK/eYoeyyqxId38nAAj8nW4m/rPYwbOAsYaoxnFHvkySh0tU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV1FI5ZeiYxsea/FvTHdi1FtFenfhB+fNSj3CEyhLHWybFhxcJ
	bit+/mxK+oNLo014hGqSbteBIwyWYNXzOOvIozm9hqSHx1XpA5jeVm2kC/VaJPouBSA=
X-Gm-Gg: AYBFou1ygo8orf9ttApYPh7MOjpIRoxH5iukZWt3bNP8OVl4J1n//BT4HhlBh1kql8e
	K5A4mgHfxP+wYEG03pQPAtsTzcvMhQlUFrUsc6raFiF1f5ZM0Z1/D01o77iq04nCINFBvGcpd7u
	b3I+SsGHiPfy+XIMZyhlBMW/qswvDQ+7eQSGRM1xY6jXQbxflowTSd7tkB50Cli8MdxpM8PO+61
	itlwHZpGGGFO3VL/C2R9R0Ugdppyn87CW4XsIQCPX3nH+M8yJxbrPT18bWghoFN1fBNC6C7WdEw
	P23YIFZ1fn3NevmHr06Re03L1xGUWKb5X29pVGSTT7fORg6ZfsTvH26dai/2SzUOEcCH6VLqZm4
	8qJWGOZlF04dPlltytfTjXbUVHYCGdu2wyTEEBRyvnxNQeBFPw3sGKEa3RdDIKEz4+oyUEJIAt+
	ldt20EXaxDbc/IfH1h37fB7VYXG/8YCXnjkHQWyqk2vLKGnHW0eGH8xm2YFL01ouGfb9zFo8XPx
	M4vFt5/zm5pxSdk+J2J6zYyypFvg5NjryUqhNvnRW3R6VHcwiYnt0TAJjqR/TzuUxLjWlWbpTmj
	c/fp7BzDx4Fm31vOu96lN4GkhPtSpLwioN4TNHnm45jJ3nPRjhJ7n5fl8aOQCIohjcZQEE429am
	unD373AM2iAAT2DWHqVdBcZI8YydokbPK6PY4y0LpVA==
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4ac17b2c38bmr39334255e9.11.1793357340095;
        Fri, 30 Oct 2026 03:49:00 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm68659585e9.12.2026.10.30.03.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:48:59 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 11:48:58 +0100
Message-Id: <DMI44C1VHP3L.1B6WSA5BOI6BY@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>, "Tero Kristo"
 <kristo@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Tony
 Lindgren" <tony@atomide.com>, "Michael Turquette" <mturquette@linaro.org>,
 "Andrew Goodbody" <andrew.goodbody@linaro.org>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>

Hi,

On Wed Oct 28, 2026 at 4:53 PM CET, Ettore Chimenti wrote:
> This patch adds a new clock alias for the DM816x system, mapping
> 'sys_ck' to 'sys_clkin_ck'. This change is necessary because the voltage
> management driver searches for 'sys_ck' in these systems and fails
> without this alias. By including 'sys_ck' as an alias for
> 'sys_clkin_ck', we ensure compatibility with existing drivers that may
> reference 'sys_ck'.
>
> Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  drivers/clk/ti/clk-816x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
> index 3b8e483aec92..fe6f66fc5a05 100644
> --- a/drivers/clk/ti/clk-816x.c
> +++ b/drivers/clk/ti/clk-816x.c
> @@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] =3D {
>  	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
>  	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
>  	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
> +	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
>  	{ .node_name =3D NULL },
>  };
> =20

I'll drop this patch from the series. The proposed approach from Sashiko
seems sound and I just sent a separate patch that implements that.

Best regards,
Ettore
