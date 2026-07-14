Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8D1A267
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034982; cv=pass; b=YMyHr34zO4HPdIdI3rWvZ+CMT1/VrMc5J0dfYQYsrL5fW24jq/TD3wP1JTsjoLNLGH/pje2/b8GniCkq90gDbdpjIX6QIZrZ/fFjvvQmYeyT1pI1/8lx5W55dhT/m2UpgPc2adXh/kIIfVoGibxch1OYC/5OxgWjZA3P4572uOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034982; c=relaxed/simple;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taPQcZf79NhfIfN4wSKOTEV2xVVXMHlkoiDNBYzxUlL/YHb6zlFOB1S2rtibD4I71hy8RQxOMoKOiZFYZ4qlxeBFiiht6u6xr+fsHl/qjlC1SOIDL+na1o2/7nRHQZbPyewgk/+Eq7pSlQXefQBxzky/oqOMSQjS03azShqvhfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeDP1noV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cioL0yS+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeDP1noV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cioL0yS+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO7uc108249
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 13:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa9tdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904ee4473a8so47973786d6.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=FEA0V4O3yRIYhL2eO8qbtT71oA8uO30qJQY8G7Ubiduwr4NqcJ2J+XtsEvgqRStxna
         6T5Ri5/pAKCbrfFPABE2qRyKTAbjcEAiJHJN1/8TAgAhy5Z37swMjCltOAaXdsQkKOWI
         Ha6xffUqbC7Dtt5XzACtvkMT0GpJwj6m/Rj+gSaegzCSHEIorimeT2UeU8GD/KO8p+HA
         ummRFXV0mRdsXZWAd5Zk95hyh8GUVx3rZSCbaCTpG13B1mAuubCmFcfYkQ573WXsRWvS
         pEBhLRWkmQy57SGVGislkfy8syET+Vf87vwNK7tYyILKSRHyb6VwTujszcpJNQOTqwck
         JaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=m+KK9xF+zCvcajeLPTluXiI8+LXAXlaM9lxA4Me0i18=;
        b=I49SZ+vm3qO6zAQEyAY9V8jju0YtgKTWlY2pdiLzO8m38HbKqjRGvlIX6MMVEHupny
         ByHS4lVoGiPAVM156PSEeMVlPZJ1nzKNg79ZpbNXw8tcUsKudMznUXB+GZcw+mIPh1kF
         SjBBITmXiRpdhqSFTJGwHsvwfIoo7QBvw7jZvHOW2GUI9qar8SJrCm3mPkR5ilqjzrqu
         06JB4S6o5IHslE3qxcyXRvB0H1oZTfZzXFivS1k03rh0+Z7dyRlbTBJcLWZT3Vkc9Kp2
         LWNPf5znjI8C88vVrHChSV8eV7zMP59Sh+XD1Z60Js+SN/m3G1u1ReT1IuZjlR8I0MSf
         XS/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=cioL0yS+m7iQ+Un4y9KPRfCvUwbZxC0xQRu+SZmRcgaQHlaMpOuyJETcrk+xsCydJS
         rx/JXZ0vlPSJ46zxZ/moLbkLzEFFO0TXJ979XZx4o6mPym2i9kzroOI5kygxFEe6Bi5R
         LgVxo61fu3nXasj+kizAbtRICOyjFgRCjtp6XrZ7uzeP0UIS813j7bgUxON3fRhe9zGY
         e7doqxvCPS1+FdTC+4IGTzIMO34POO2/rH3keQo332wYpg9bskUCjm7FIcDtJLzWa07O
         /D1x4xq5YKRCc7P8jD/k0p8unDHZTD20lZwtiaqEydbmFKT/XzVNkmPqitS0BB28LQTQ
         x6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=LrYMd0i7Vze6QaMex3/LAxHFoWTTKk2+hT9XXNcNOK7zlhkdj0CdKVKnrMxgNyw7OV
         jBhK0ZovVfrHTUzJB+R09FdpgQrBiZ+X/ERFdLH3NyALLu+hQRQrORO6a/MwGubtRPDD
         S/Z9U6lO3dXQtB96eP7bJ0xxx1mi0jk1fQlvJmvea5zLOlQ0UDnUX75KUsyBFGDjYfSc
         v2/LTT4Zai81aMvxr8w01oeSv8r+Y0Pz7yPMdUL9TuK6bixa4JjIL8518XbAD213DEm+
         0I+yJ8jHc68n0RYr5ir8PIoQZKX/km8J3GntTSPYugDnLQLXADMXS6oRUEjFbfLB6IIy
         FC2A==
X-Forwarded-Encrypted: i=1; AHgh+RovSx3osJ4Zfa31jCROWRCEG2eJFO7u0M1osj/x30LHJzUDRo5mnBZKPKudlMNdEKZqvQxzK0PyZD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPfGCbL55mcqVuLsY72IdL5jEAMKwmJxgfgTvfQf9G8kDB6XS
	FMR6PgWVKAE0HlS3mG4yljILK1QI5OB+ELb5c3maCCE82D2+JNzTHaxDwo3WPkCa0nqsO/vqsNB
	kyNTHYNbg2zGrejx/4StyK78bgsa3EdS9QvrLlVLNxaJoWdXP7x/e6M/pDoDqfIm8tEKsHfjR+2
	60zVBlMsUJSa0TZGulvNg8hagGB18yubRQS5osow==
X-Gm-Gg: AfdE7cnaxEWnJlrKQTxbETpBW+8B6rNr6yIfRT4fwIkDf6aCAmy3Gx23MlQbZlmOcej
	rUPSPVNrvApTW0x81TNA0ds5NZtBr9CN5XcWObdW46LzJ0C1Ne1w6Ve1FouaIsRebpsNcNSL4xE
	z2Il677Il04zbYR9iG4D1cJExLqZohR2irqlu88lrygCdsTy5Pe0smRNmPSBxSHToD7XQd
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880176d6.57.1784034979472;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX37OFBplE4ZQC
 DVygaKiHaIyv5hI3baBJCvx+VVxXIZslBWcqOV4AUWvlyQExLJT6Rt2ipCIgLhQaJgCFM8yqfxX
 ua983fdHFWjMb1QtzKCrLXLMEhPMf7Q=
X-Proofpoint-GUID: VOECFWpFhdip47ldooZ8xBH26pY4t1dZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX31oAwZuJPTYn
 pG573HKO/G+yJosXE7uv4x1pVYYlrXO9fIGDqpj1t2ijV5W/H6qnOohf8Sq8c8+haOzT49b6ctd
 H2X9CKfeb3Rk3FKFoRv7eDHNJFfJW258jbVvzgiUUTG5z5x2gkjRmIyw6+weT9AHBrdkkoPWL4C
 8+SUGQbJuJHrb8VH0PCRwimE96MueDfEYdNnfNJXfq3VumW+FEy9V9ngHBR65BCtKfjp324xnc9
 SjpyH2xtXCW0DipPFQrzWlS5yG/eaRvpBy+nW8ygScIy2Pw8T3KMqKoB+MsUIJjpdlfttL+gmUD
 Ev90uB8lInfETUMwxX0NzEoao3kwQ45nEBL7qJPoTEcmh+9y+8/f2vByvaqFcSsvHjn+TZzwU6e
 +p2yb+gFtpx+YyQr3E+S8UnAicd73WEeZHbMW6uNHUxPSjLO2Z2N74jotlx6dLVl9oYvjCpHAaK
 uXLaSh/snBeeNseuLgA==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: VOECFWpFhdip47ldooZ8xBH26pY4t1dZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140138

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe
