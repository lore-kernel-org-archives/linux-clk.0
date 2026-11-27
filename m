Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779642;
	b=tgcONYozqzwIJl4wiujoAM1cnITjlp0q9lR5DGbubCCM6FiqPXAroNFl01Hjt7jnSn4B
	 Wl+Z3at84WYNlsepqPa1402SVCDoUZccaAD5fHlyRC/gPJyDsv3kNJt/IcRIpKDeOaMi9
	 ugwF1wiJoOPLbzcJiQ4llr43pQulnYTygv2Tt7eOqPq+0maW4DLV6mZRvje/QfJkkx+FN
	 pMCjKqyTdNoj/lokx7iVTd5FhdjBlUFZqXtyEM1bdikobGPiXOJ4GiyrHe2Tk3W6nn23b
	 GyuCmFyhFR59FeknksK6BOoJa2S85OhCjgWDdLAoH1QNFjwDD1PlxdKOMGfIrwcDSnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o8EZjWxTXRcbyoEOqIHRMz+zl1HnNBukS9h+Zm+DoZE=;
	b=ezXVS3zB5cTCUdmpN1oGdx8KDc3XNqBqFS350R5ued7QBC2VtFs6Z63xVeTeTL/Ykmfw
	 7RNRBLH+MeDFbm5E80yq1gz5pscb0kWnbWFBoJJ5QRwad2+K+KtGDsLfg5IATwuKI0XXL
	 lKuTamKEGPxFMgZoRoiP/3k5rHsskaD/yxLIOE9yZn+9xqs1DRHZlanUlaXlC/Dx3lutV
	 4aJAkUbRRbPMMcmmSekPlYPoEb+12pdV+RiaxY34IHkZ1EBlQQv9IBp+MiaafOtVlx6/f
	 lnCGtSwhB5T6eiJf4+XEw0x6JLT9rXZa8cw96TJhIBa/iWSC8UCawVO1ldLIfCdGfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ygnNNrYj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94DC606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ygnNNrYj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5413974f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795779640; x=1796384440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8EZjWxTXRcbyoEOqIHRMz+zl1HnNBukS9h+Zm+DoZE=;
        b=ygnNNrYjECMONs5ImETaNDap3ahwaqQ/ApDKpPoyDE73kISxX4kXZO/n987uZ9zpZD
         DlFG9P4DHKAW+1R3FTUBokWg5G2vHzaZ0aF7JTKvmbA4JDVSZflB0lFoQahZeB/VHK7/
         +Tm0D6RPNLEHhJXoodnHX0QTaiqKt3D1utEJGtu45UEAvZ3MNrv2j/s1gVMnML8eYMx4
         T67LcvyrPoKjlVuTt79XlyPcZfyfPsGALwL9SKb70cAxv3ObWo0zdU4UQUmk00u7+ZV5
         nMRp5EjIfxUAzCTzB/heUzRZOidhnY/+xL0Kgg4KRLSkhQvMkF5TCyOFuEVVaq1KJQXD
         LXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779640; x=1796384440;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8EZjWxTXRcbyoEOqIHRMz+zl1HnNBukS9h+Zm+DoZE=;
        b=cB3gKKCE5aM2CByC0EPX+gxUCBHumgQUnljXEEsDmUbb44V0o5npF1wli5soopv2+A
         4E5G62LLD+Mr4dT6+lFV/nH2EA3Ni7bL9i5+TabJH/wH0YYkWfT65FEbutzgWW8x6A2o
         +qaFJF1bywMiSsGUZoyWargyI6eSyii8TuwTukSFhHkrKCHD6s15nWE+WNSiBw+EWaeO
         VYeuJTCPj9oKvxN+IQN7KRveUPyr09OmDVTD4fH6eRxWxOJs0ZpEbpmBpNYzOzuNl/Fj
         iEoyrDyUGkc/S/bbO6XPr/2aNfooWzNT6aZay8/iBjuQavpdTcDCvINtOgYMEDiQf5zm
         qUYg==
X-Forwarded-Encrypted: i=1; AL+hErGbNqhMAT48q7inmZKX+br0sRP9e/yuG66FW0GJCRHsbQeXqu7a1rx1XtkmTm+ehDlNbXxug1YkOyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qpay/dp887LHGTIrq474FLLlz2pN26C920uCNmGQPDc3snHhc
	zrwd/gZQEqPkHkHjrZXTs8fJdlMPEdNay5BpwbkIa19PYLkVUJHTfHumuFCyeNqCG8Y=
X-Gm-Gg: AZFdTZeqj2JbBzUMbdcfCdmJcyZ4qYmwTeBUn7b6S3ee/I2++uhRUXmW3L2fuLRzWSs
	OM814LHlRUSLmzaQlhwID7U8Wf1vDN8ENVzyG/NIOIO0WgkDOzVynPwQBmE1vKQnnT3tRdhcQR6
	BatwlhG/fMAkD93k7S/ztJvQ048onMMpNlA/vSjSr56kQpq2ROU2vA4b/+lS3s00zewcN7wPaK9
	W/cnlWtdG6TYWQOaYeVkmn37eLHd0uBg27K3WKFQJ67l1LZFV1xCgh8c0Xh13uyhWZTEIL/YMkc
	vPssF6UVBw5TSoGxfq8ZS5noT+ambdRuRGDVh8Da7eMmeXeRzYbzSBLN+Eu2CEdUZ7/kus/PJqr
	DsOVocP0dP/XhdocPvLOYUeUxXlM/R/bsTQGF0R2PRl8ms+4UhD4wWl2TrO5Z7Wk7roJcXaH70w
	Xtzg7JpHEel64TH/05aG2+ojuD8jTMHA8gX1DPTjibbLuuWpAwAQ+CERG3cRwfftHJkxUdKn1Gh
	vne0zcbvGDYzwp3MjoBYRiwle2NK+h/BQB+2fqYI8ZSfoiGEeV8jRWzhiqUNj1MEBukVMhXy+Qq
	PHhDzspxGrMS/NCwjzuLIZmwDkXtgmqTEwg8Hzic
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr527719505e9.22.1795779640144;
        Fri, 27 Nov 2026 03:40:40 -0800 (PST)
Received: from [192.168.0.167] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm330037855e9.3.2026.11.27.03.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:40:39 -0800 (PST)
Message-ID: <19724121-c02f-4ad5-a6da-eb01b6c63006@linaro.org>
Date: Fri, 27 Nov 2026 11:40:38 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sc8280xp: Add sentinels to post
 divider tables
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-2-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261125213433.1438537-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2026 21:34, Vladimir Zapolskiy wrote:
> The PLL post divider tables are passed to divider_determine_rate() from
> .determine_rate of clk_alpha_pll_postdiv_lucid_ops, and the generic
> clock divider helpers iterate over a table until they find an entry with
> a zero divider, however the tables are not terminated by an empty entry.
> 
> This may lead to the out-of-bounds access by setting a rate of a clock,
> which is supplied by a PLL post divider, for instance a rate change of
> IFE, BPS or IPE clocks propagates to camcc_pll{0,3,4,5,6}_out_even
> clocks, since the RCGs and post dividers have CLK_SET_RATE_PARENT flag.
> 
> Adding the missing sentinels to all post divider tables fixes the issue.
> 
> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
