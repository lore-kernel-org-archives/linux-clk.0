Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BD39A063
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804433; cv=none; b=IIFHOJgT/jNktuca9nrZzeYYsrM+oskMkUu6tjoArCFpDnRrRp9k26U+v6gDqbOazXRbfCl0m8/DEHtCQNNvZ40mMQNsupTTURPKIS9KJMkzXjRK+Ct+BhSFC4llTr6zd4YmdwCv6EVa6KPgACTFGAHVdqfKe/A2HY180htkrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804433; c=relaxed/simple;
	bh=YNCEyHJM1ySzBsalU6UojRrbYbeNUuReV/pYWY+/FLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBPuCAic3OdmXWrrhKtWrpk/GkhAgTvHEQbj36iXNXIBH27gTufpc3BaflfhNIFkTiFsSpxvTCMxYxX2ps6Zh936D6tb/9oC8oupMVgXMmgd9W0foHbGBpUeyamCuku8q2dp9EURDitR+S+FCyyR6prZlQvx51KBFaaVHPmWH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wa08QrgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI2OobMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wa08QrgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI2OobMA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Ckkx1091060
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 07:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrJC4pvBdbgv6oTNYdiDl6at
	7BfUo6flLNg8BMMb+q4=; b=Wa08QrgVpDS7GRxf4ori9b+dmuAbzzzrpt/KVDBf
	zH3tDQ+q69FksCNjEE4nEcglEiAKowC8WCuj+4iKvpF+LviIXruQmW90YAJT90hA
	wuCcVPlmvd4jO3iS0RXLAaNVzd6QTcgBpliVvr5YUeNsDHmimNPiHQwMb2g+mJtn
	Eavw+J1dFYaIgqhwXSKehGOVPX++a7P5MNI4kyFV1Vp/k6i9BzHm2/WD1LcEzLSj
	KvnX4nf7sOIyBFxvcYjJNtj0lzl/bd7SDHzY7Wss1jdZ70rQozjFQpaS3Cy8bDtv
	CJee2iMG20vqRjPi5oc7WQc1xsJCodB0IGS83jf86gBSWQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5ryer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 07:27:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so1876039eec.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804430; x=1783409230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrJC4pvBdbgv6oTNYdiDl6at7BfUo6flLNg8BMMb+q4=;
        b=RI2OobMAT7WVoB2Bu7ARi0IyTVCOxPef4bPhVEkvqV24FM8brzdsxzq9SvPaJyCc1O
         vgr7Z8xKhHXZeND1pHvGm3zQRv7oxvy369f1LzKLBxMnTRWt2dTHwDCTPSDavwWX4s3Q
         jBunuct2Ao1k5pa9Qs8E6yvO4kGS/hIta4ANOF41ojYANkMsxA1hrczS8TTA974pbD/z
         JIkA5YYoXznEUBc8FWbEjOANVJNRUCPixm1W2hmUj8SuezxfR8QeVSZcOdr5Cs0pmp99
         3RA7O33i2cNPNN+ajNin89vDy3A0WBNVNGuhuQU+d8PasrSUBh7rUJ6+k1ROQ0TFBh5t
         Nk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804430; x=1783409230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrJC4pvBdbgv6oTNYdiDl6at7BfUo6flLNg8BMMb+q4=;
        b=olT29T4haMWhJzEDj+kqe9VaMm+FMcBKqxmbrmQrfTbr3e1kDyJwYhs+uW2gqrhOsj
         tBbg5rGoM0jw6w2OXoUDTxzB0GAmRpup4sKhCTgGwY4PfkHzJ0fxibTOu9S8CwdIy+zH
         LC4XZB2/a5v332GF74w3wrhifwwo2UDw7HfNBWOJGOEoSsbiuDMm8FONUFvLfFRj/uUU
         qcpeBNRZeIZYxCibObEXdfHSlgFbDWJIsrrpNX+PZRulCTWOUXLvVsOb+DvQMEUErC6m
         f5Z/Of6CZ+6x81UJx+cJgalssbkqXkJ/R0u632NOpSqTeg+TWH3qndPFjwBbvPPY0ex7
         1bmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgHqKwqPagaG30rWfj3McsdKX2Xo7sDqw27wuTq2SbVf/Rd3dh14m9vq4Y0b5ggCWVINCEoFSqzr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8gVksb5Rs4sBYTP+BVxpKS4vnXGTZ/teOEycvj/eLTwRFYZG
	B3P+9dYFgv7hqzOukWlM/hOoSZEISYExzU5D0prQhgvlTBHszFmnwLJ4nzJTsh1sUk2MdFn4PEw
	snyrDYIlwDaDcMkwgTaxRKjtYFbqPNUzp/+UHC8MY3Y5JoBGheFaNlq8XG7KpVminY8cPhms=
X-Gm-Gg: AfdE7ckBx7jeyIILxsxRwFJRgzE8xw9jv4TU+s8MquH07prlKzrke4A4CXULbbn7tAI
	cp1YlJE+wlbeul57Atn0xoZwep1pZGYkPIlYIPP3SXRKK27SLUaXctG2Vo0OcDDp/UkRDP84n+r
	yxki9bCLPAWEOpuzlYKxvXlFvypLCHNHSP33Wucoe55t+nMoqxDlqVwMKbwuL90M7XpKIW6il+z
	5kqTzWHV58okUqOtqkdRO6Hp5ErVIJTauJ+x3UFq/oV+qzPL0uKtiS5Vf3MCncoNVG49ySwPh0o
	6iJEOYethu9igH5rjHGnh3kbbeSVW6jwi2vN0fzF8wK6VH6zlPR8Ei4RFTKAnghM2bHJ5f/01fE
	TDfaeFg1hoc72WTkTO97PxPKTCyCAS/1rGcBJf1krqkp4fPar7DJ0bxhE/OvvIihbbkDrThma69
	Zlrzbp6C2RbKk5JI1Fd5+vwcDQtLhCL0TNst4iN8/6
X-Received: by 2002:a05:7300:6406:b0:304:d92a:e60a with SMTP id 5a478bee46e88-30ee1478ee9mr1883213eec.31.1782804429775;
        Tue, 30 Jun 2026 00:27:09 -0700 (PDT)
X-Received: by 2002:a05:7300:6406:b0:304:d92a:e60a with SMTP id 5a478bee46e88-30ee1478ee9mr1883192eec.31.1782804429243;
        Tue, 30 Jun 2026 00:27:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31711acsm4908720eec.18.2026.06.30.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:27:08 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:57:01 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Message-ID: <akNvxVS/EW8LmS7e@hu-varada-blr.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-resilient-lucky-lynx-d9db0d@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-resilient-lucky-lynx-d9db0d@quoll>
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a436fce cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7cbKSgm_W0bIH79rPYMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 1DQE27jA3R27SSXhlDfERJvtvwK3zhju
X-Proofpoint-ORIG-GUID: 1DQE27jA3R27SSXhlDfERJvtvwK3zhju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX8nJ+f9JitZmK
 U2Xr+7L+sfBCL8jZm2o6Ihuk0frwwIag2u955aUKzAmeRFG0ngF66l6TfpnErI7Go77i5dxf6+5
 S3jgpgwVUMjh+pDyS59//C9wcqXf3ElRnH36YE50zzSIQLEIo7LBoj1bXXaqvv9zkTwYmO33H4p
 41iJ4Wjwjr8iixruCoHCoc7v5e5Jsony5hLVVxJhtY9ASPkESd88oUljqv6n3uHHWt5RU1BnwzK
 uMqcLStR3vDTsAa4oi4NDRHWDMgaa2LJOUw+ugF9/0zRRh3KjW2c2YmIm0tnZXHVOGVsM+fr2kV
 vIhojG4ehIcMG1LW25jbNkmlbTp1pK94UK5jM+WTaNAMAXFOrCL/PjWCfZyftbTfqgj1GX5g0jf
 E9wWH7XpaOllRGxPzQnRrdlq0LVesltFDEEd+yMbioc9JCcSIBgG5ZezNqMTn0sFTL/Lp/pVkua
 Hk1c1gaRu9zcXQljj5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX3f7IcMwxvXQY
 0XkH21aRaiAvWDjrj2lGd03wST6RVC6D2gMWSQTp+JAPozysS0Fi8dgIxuAGoRVdi+JM2/dt5ch
 tXYn8SNU/YVFnhqpHGEmYylhhow4708=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063

On Mon, Jun 29, 2026 at 09:30:11AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 10:08:41AM +0530, Varadarajan Narayanan wrote:
> > IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
> > for the APSS clock to change the CPU frequency to one of the supported
> > frequencies.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Varadarajan Narayanan (2):
> >       dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
> >       clk: qcom: apss-ipq-pll: Add IPQ5210 support
> >
> >  .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
> >  drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
> >  2 files changed, 20 insertions(+)
> > ---
> > base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> > change-id: 20260625-apss-clk-ed39c40ed468
> > prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
> > prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b
>
> Really, how?

This patch is part of the series that enables cpufreq on ipq5210 that
enables APSS pll, then enables the mailbox, and finally the cpufreq
driver. While testing the cpufreq + thermal sensor throttling, needed
the tsens related patches (both functionally and for passing dtbs_check).

Will drop it and post v2.

Thanks
Varada
