Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2A1D86DC
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573772; cv=none; b=DnoToJopAq+XvqZuMwNzIHulr11Ekjy/tyUfMmstvD5sMMfdEgv4C7Wo2n2t+B7Wz24SmMK5L/5FUWYA52zK9u8ID2hwLJ6XY3F/sN8FedlvtiDB9Dn/+t57urTtt6bH4/AutD/U7ziZL4Vt3fwJfocfyXLHCYvM7+QiiPiyoU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573772; c=relaxed/simple;
	bh=Qmq+IIeW7g+9CyCIBj9m9ESzvYm18bl+IM9u6txU21A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=V3H2lrZ9nK5FrRuamhIVzYgEWmfaSwaWBIYmYpyKeRr4AYY2BBLh6t+dZFYqut2PgvMUC7VuF0PLJHjT3sjQ+cFHAyD0Skiy58WS/ydwvuN3ue3VmLrwmq2mnDdIXuHUkcdncmihJZE4LXqDqaUdjmN2T2057G7CEPRT3pfeD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uGVAE8PB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uGVAE8PB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25520a289so390412266b.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742573769; x=1743178569; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltF0A24cHxopXYW1+MzGLMtAYxZ2JVfXqEYIh6iUalE=;
        b=uGVAE8PBGtIQNltl5ur9C2SCvBKHnGvJWqZVkx2fdW+Yw9VfyVb8d47R5lnI+EEe8P
         iF2a3m1+JYI5UgPh4dDWlzWQLgRR0fqmUT7pXaQO5PkCttrFZR29gEzU61ev9pL9NlzI
         TAF6k9k/WrM6OTuDnRpYK23Y+OoxfkE9EdcVYlbPIq2e+BhFXvG5idRF4+2q9mHgtCi3
         G9O5d5iKhVnQIVcu4/aDjldJUsBpmL0SVYgkiCgTObVahuyBQRX6HMPOKkK6dmU2NMBn
         qXc22r2qAtS5UvP/k22r9jdBBWr86Ryy4uXj091wr8Db7nR+WaqAnnFWypyZQLq6H+k9
         9OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573769; x=1743178569;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltF0A24cHxopXYW1+MzGLMtAYxZ2JVfXqEYIh6iUalE=;
        b=N7dd872vsXRrmgKEWblL3RDbMpRwK6dHdSItHs3lscIMhDVKxOwQ8/4V2Lq/OJDxRf
         5siBMT2LK8UfZndtsXQS71gFxtRv8KMy2tRZPeW78TqbywItUfszprk1zjOAgtt0TV2K
         rd1Q2PbuT4p8++v2sW9APANVaW0SFfOjlSMGVi0FQ++2UNw+ak9FaWmrwg9cmrFf5ckN
         ERHuCCPFaTVnwrE8CLvZIYW8+noFpRiFOfi/YE8RkghbrjvJgMmM7Zpv2juXfz8sK6fm
         QJrAwkVFqkfkFg4iK2zXQ/uVaXN/FqTPr8kLRNA4m44RFnjpP6quoCs1znxC6CcVyo19
         mD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH7rGT2S3XaXRGN7FvdA+cAmD00iKJBtT+b4vuOAeWONIIxdWMmVNM7l02scV6Qq597vJl86fJELY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99cPVDIYgjFRBTLlH4x8HaUy3v8p2tZrAqPQOJ1B5bBomlMgE
	guoG3907f+oZ0lO00KOxlPWpQKp4DPSEokEMVDMlodfWfV0IOCVMU0/RVKi4BV0=
X-Gm-Gg: ASbGnctwNNJr/NbswTR2dkWJurvbl0CmgPtsXunU/9AwzJIzOOuYAof1fq0ZeVUkkxc
	yC8Gws6vPvAFV1zO4mdr4qi5igITMRWsy9sRFuWClE/53Kl54nNfaPA2drqWKWxQumPTWr8QAD5
	59gKoXco5guwnFeHdLEhtJsYyxzBq10WcdL8dV9hRdpbOV0aJcMOuTkbuypEr1cYo7jtr6OPdFl
	xox18c6UCwd2blX0byoGZGF+lnJ1TU+RT7CoU1GSsq6ENDq/tLjvCN1pcuu9Gb07IOz1w85PbCn
	uCLtGCgSOFH/v2VIHRKYk7OPR4jtMVvCH2x4F/xmFSBdTj073q9e/i4DINS4UcqyPiQ4MkJYt9Q
	EZLkz6pb84tpVmY7oM7O9pM+2
X-Google-Smtp-Source: AGHT+IFmQRpczSkNyyOfrjuw6J3EmbsHDKfFAxtFhB+1mO1JwxQr4UBgvHRHJp6Da2DG5aHbMNCDNA==
X-Received: by 2002:a17:906:4795:b0:ac1:e6b9:57ce with SMTP id a640c23a62f3a-ac3f208ab90mr381700166b.7.1742573768555;
        Fri, 21 Mar 2025 09:16:08 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfe4esm1546076a12.73.2025.03.21.09.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 17:16:07 +0100
Message-Id: <D8M2UHJQ86Q5.2EKUIIDRE3P73@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Taniya Das" <quic_tdas@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] clk: qcom: Add video clock controller driver for
 SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-2-c5ce1f1483ee@fairphone.com>
 <pzevgib37fgdupythk3mawmeuki6dflpw5bze4ujb6jcjvj7ar@jmjuzeabvq7y>
In-Reply-To: <pzevgib37fgdupythk3mawmeuki6dflpw5bze4ujb6jcjvj7ar@jmjuzeabvq7y>

On Fri Mar 21, 2025 at 4:55 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 21, 2025 at 03:45:00PM +0100, Luca Weiss wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>=20
>> Add support for the video clock controller found on SM6350 based
>> devices.
>>=20
>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>> Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/Kconfig          |   9 +
>>  drivers/clk/qcom/Makefile         |   1 +
>>  drivers/clk/qcom/videocc-sm6350.c | 355 +++++++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 365 insertions(+)
>>=20
>> +
>> +/* 600 MHz */
>> +static const struct alpha_pll_config video_pll0_config =3D {
>> +	.l =3D 0x1F,
>
> Nit: lowercase hex please. No need to repost just for the sake of this
> single line.

Sounds like there'll be a v2 anyways with dts changes, so I'll fix it!

Regards
Luca

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
>> +	.alpha =3D 0x4000,
>> +	.config_ctl_val =3D 0x20485699,
>> +	.config_ctl_hi_val =3D 0x00002067,
>> +	.test_ctl_val =3D 0x40000000,
>> +	.test_ctl_hi_val =3D 0x00000002,
>> +	.user_ctl_val =3D 0x00000101,
>> +	.user_ctl_hi_val =3D 0x00004005,
>> +};
>> +
>>=20

