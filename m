Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869312D6636
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061732; cv=none; b=XN3ATQfnmYNJGZMq36LfDuDkOvXq8gOF/gqrB6U0XiFdreDJUrYvPTtow7vHmAGzA0BuX/vd+gf049rV8bf29uGEAx4hib75RF5ALQcLlvCsMiQpwLgKUfYfHp3terKcq5od1n+t+0uB2/miLqzE50NwnqNL6tNuJB0aA9j4INU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061732; c=relaxed/simple;
	bh=LuFaLCJ0xTPoiWwHiRW6DMu6C4be3/3wdgnHwU5aw20=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z/J3WnkG+zx+WRoxg8sQ75B4ax0i82OZJ1v75mwLc1lBKUJg/ajFWjU5RcJxTMTVCrlfFsPtrz5AqrEgOuynGgvLkwTEg8eAPnUcoHfdob9U5tUnajBFZuonSFuhdT2j8vf6Ss755k1qBToFRcjMSwb5BcVTc/74zOwKvgwDiTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N6Qx6lO2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N6Qx6lO2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade76b8356cso994999766b.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061729; x=1752666529; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7251uwJfwlSq32A9Vp2rgzafVtiNna6bej3YLziW0U=;
        b=N6Qx6lO2URXqxTheYpr0pbnhSDFAlFwTG/3+A0UDlh+TWi08qhFU7NLS4kHfJ5RkLc
         fqRyFyyn0x4JezJj6FOUIThCMs/mSSa7+IVNYFO/dejS4h+iFB2f2euXiN/jJpJ77mDJ
         n79c+jZGUU/mH7KnKAt/sJ/XW/eY6e616pUK+Y4m1F1gtljFQ5wsFy8r/JSUe8uaWx9l
         apeqCUr1j11/vrv543D2c5eUWITRibL2488RJCAlN7r23isPhIPVIYdUL1nT4sDtmqAE
         sne5ox5AjQzs9q3iDVt6MwYHfzlloI9WirB08iqZ5SMWr7qTg+hFeNWd3YcppJ8vH7Jn
         FhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061729; x=1752666529;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7251uwJfwlSq32A9Vp2rgzafVtiNna6bej3YLziW0U=;
        b=QT+NU1EsbmoZkt+8sEi12AIYxHnBjWjhJ2YBNuF/4Ex9QUmQzHkynN5ELzUPFj43ET
         eU2wbwwb0WkM8epOiXxIrbL/kNvd2lUuK+01Q5Z3j5z3IQf53avmuWjLTzAzcJ0Qoqde
         k7X3GYstNtbm6oy5y49rBQLTXW83kPfwbJZUBP1Tpg4APcbNgdzhI4KrZ76gr2UIRR3a
         nKjtc81ftOPzRfG+XB4/4QBfj9Xo3KNHdu0cMiJMe3YHDw/KBmjnp4DnnpQYJqlKdl0E
         CpJxDVktbNsy8dE+T41zXLM5xRM6hMI8UxZEJ6ZGgKYp4idAVZRJkZEzVf+p6BYM/utO
         kMYA==
X-Forwarded-Encrypted: i=1; AJvYcCWYjH53os8BNpPfD7Kv/raA/9FUQ7felJlcn8Xv2SPgikGqHgv+q8Q7+mTmwuNSsBIWZAXhVyzLhWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJt1KUu9FFbfMRqGePm0KA/6Jq4blqeY8dkdCk1gnw7OZ4/3qE
	OkdXFf3S2rE/azx74dCiq59UoCj3NBGzb7B/MprGijcnenI/a4alKpcHMjYVyvslumc=
X-Gm-Gg: ASbGncuLLy08wT7K8dttpc5FXhM3S8dq8RzO0FQZE1Rt5y9klrou/jGGUjQxgQo4Bot
	LVvOWQqQI3Ti78d6JioRnQ960/FM6x7UditVZFbsq5TIZQRBHVGZj+nwATiLf0IAejzFdfA5urj
	o/WL8qP7w78iFf+a9vQrFhO9Tek2jsSDRkgbT6S4Q6BKb2xbLU5ml3l3e44tsMecSbC9tlBKhXi
	Te49sr2Gx+QC2z5VQjthnMvcl1W2qaDh2gnpfF0G2ts5YfmBjzsh3YoPpvcnyrFX4YqCc1/6R0G
	lXsF4l6/Ytol9XHwqGt6vXq7s+sRaGT4zDkdrh1s3rMmwNmvLf/vtrF9CwZPz6nXlQH3ZB6p4d7
	tVxuOQccAjG+l7WqiyBtltbcsc+K6UHU=
X-Google-Smtp-Source: AGHT+IFHTk7KUMsYqkCmoCKYDOQn2JjjlDGYad8nB1UbcgqlsPnK+ZRxIkDwhxTp1MQMCfkMx5xzIg==
X-Received: by 2002:a17:907:f816:b0:ae0:a88e:6f20 with SMTP id a640c23a62f3a-ae6cf5b81dcmr253307366b.15.1752061728625;
        Wed, 09 Jul 2025 04:48:48 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm1091150266b.107.2025.07.09.04.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 04:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:48:48 +0200
Message-Id: <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Taniya Das"
 <quic_tdas@quicinc.com>, "Ajit Pandey" <quic_ajipan@quicinc.com>, "Imran
 Shaik" <quic_imrashai@quicinc.com>
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jagadeesh Kona" <quic_jkona@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
 <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
In-Reply-To: <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>

Hi Jagadeesh,

On Tue Jul 8, 2025 at 7:34 AM CEST, Jagadeesh Kona wrote:
>
>
> On 7/4/2025 12:46 PM, Luca Weiss wrote:
>> Add support to register the rcg dfs in qcom_cc_really_probe(). This
>> allows users to move the call from the probe function to static
>> properties.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/common.c | 8 ++++++++
>>  drivers/clk/qcom/common.h | 2 ++
>>  2 files changed, 10 insertions(+)
>>=20
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f=
72603b694966e216 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
>>  			goto put_rpm;
>>  	}
>> =20
>> +	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
>> +		ret =3D qcom_cc_register_rcg_dfs(regmap,
>> +					       desc->dfs_rcgs,
>> +					       desc->num_dfs_rcgs);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>> +
>>  	cc->rclks =3D rclks;
>>  	cc->num_rclks =3D num_clks;
>> =20
>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac=
9022e608a6aad35f 100644
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
>>  	size_t num_gdscs;
>>  	struct clk_hw **clk_hws;
>>  	size_t num_clk_hws;
>> +	const struct clk_rcg_dfs_data *dfs_rcgs;
>> +	size_t num_dfs_rcgs;
>
> Since all other probe configurations are added in qcom_cc_driver_data str=
uct, it is better to
> add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_de=
sc.

Dmitry suggested to use struct qcom_cc_desc:
https://lore.kernel.org/linux-arm-msm/w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2=
rjacvzgj44vmf@auonp4ugbgow/

I personally don't have a preference.

Regards
Luca

>
> Thanks,
> Jagadeesh
>
>>  	const struct qcom_icc_hws_data *icc_hws;
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>>=20

