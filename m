Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0922B8C5
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240331; cv=none; b=SLVCoILXxpnXbTsXW6UB7Z5jWBc5nCWEdwy2NJycJhus3kX7sLAjo0yHTERqeK0sbg5yF7gy7OuZ3PSpjAu2f+meq2e9gFHpNGfQ+d5syFfXyYE8tofvxcmwOl+vS9/p3aXAbh55jECLYtwckg+EuSxZkVEtO4ZZM3nAC7vc1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240331; c=relaxed/simple;
	bh=Pz3LSqnSgZPO+sikjWgv6OurkSgn5CfbQsARgMnvaBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlptwFoSrPR2Qs7SPb740E2RiLsVeKy4OnhrcH4EDW9Tf2jJ8cbphcgAeMngeeu1jyVVLzGvMBtou3BeFLHEmNb/pj+XxrvPPIIprZeOA0LudNH9hEEkTmHFyuDU3k4hYI89y8/MGtjunWgo/r+ZCtcxziIWEMgM98GtLh4kibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kw2J3vh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+6v2oSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kw2J3vh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+6v2oSJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9ZYNo248352
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hO8HenrdBwBFfXwe3brj0XRv
	Cy9c54B12m4F6gx96VA=; b=kw2J3vh7ymtz/kDj+rEzGHXzcJGFkEUWUPf0ur5W
	maaox5TuiYEjdMEYhxPsDWVJjVIIGGq4qgtySqX096u/zI6YkLGAnsB/EpWbaLTS
	IRjPKY/8/AKFPLIvnifmhm8HELFgKZZOgSfKFtu6OKNNXcNRruuUkUSnirZePBBA
	ejbUsKOAtg/iYkz4iTLIwGSkOtE4S624djbaY0uwbMAc1EfuyVko69zrVUnb4VMo
	ZwoPKd6BqvGv/1wV1Ls9FrrAEYoR8yTR6jMW6TLTFNdoLnxKgXYPFS5LzwssU9zi
	sJ23EtaBBIgq7TFOGJkfMB1wOehe0KK2vs0cDDfDBb9grw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv140wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:45:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9483e4a8662so19610995241.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240329; x=1773845129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hO8HenrdBwBFfXwe3brj0XRvCy9c54B12m4F6gx96VA=;
        b=Q+6v2oSJIfT3fJM8A3YHsi5lPT/96LTJPj4L/trpvEWi9DR7hjIYo4GTzGkmS1s0ws
         2kL1h7hSPhVv9eTZrpOdzgycogPSv4MUsnPIsqHxT7+ZiJsQH8MAXeungtZs8ngvYm74
         3RCvxa2CiiOx39xdSqKv9R/Y52PsbVhqtVTEkJudOC5UsgXHpofgrrkF/RGuASz7OGO4
         ugY89voj8Rm7zA/wkJfAFZOabnem8pYFMBfrHxxlARZ4adnqArusEG3yXH4dz7y91O4B
         NP+d7LHCHK7JydKh6hFcIboOX8Ez6wbYx3A490IsmDrLWrPJogfR0aQuFL5zXZ4Quw1y
         MYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240329; x=1773845129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO8HenrdBwBFfXwe3brj0XRvCy9c54B12m4F6gx96VA=;
        b=lP1nlhR3qY3wwx5hjaq4ILoeKeTuvLynUF2TXquePctJdgGwa3fgm6fcvbsXM01Dro
         w4BK8y/2/om2sr7oqyKwZ6dC2uEjObGS4314DWFVxvicabXrTrJZh/FLYjvxM/R4v7Aa
         q8CjGtcsECt2EnMv1qIdMhYrIVWYbBs+E9cBeH18wAG42zNNaPZH+KDwGofa25M9peW7
         3+Umm643vzxryB7KTxuhDl8Tsh0hmwTYgXw+RphGJyGXQgWXvNTkXy9m8Va3A+aGsL1C
         knFsdUBVAOUvUIwpp5JOdjXP/hgsaKFhcLZ09nwOU5WiIkluoh7/wolUytona35mh3ZZ
         r79A==
X-Forwarded-Encrypted: i=1; AJvYcCVSK1bSyAnFv7HEv2mzpKKl8Pr5H+OrqpxNZd3oLzaAgjgNNIt0riUPe/dthASRZngY1FhC+l9aYUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQM3P0auHp1ESK8GvNqKePVzbZuNfqufPvQg+C5PqCvOqmsl7Y
	C7DkIB+qwhfcaXuaxxMLqZLfXL8bpc4jARRIpK/EMFUPaRvcnLCicZgieNLOz7Vslx7Lb9DKixq
	BU2K5zNiA1Ep2/LvOAGy8buIy4Bx0CjOuMPsbely2BkRIJ5RvNKizCKl1CKtR8xg=
X-Gm-Gg: ATEYQzzR5FYoMNVVqj5Qxug6Ame1qCjoFJnS+WybJkT8yxrEeagQeUjOcJ9kHkD6avY
	fM9ehrHOGMPkNWctFekbSw+xzSyLSs7mQFC8uAOUi4g6/knK89qvVJeTrsxQc43xrGnfBGHfwuA
	L3toPSso41jywxeoN3YX/CXVAtziRsrZp5hXKarLaYmrrUt6lzB+1b9TqAFkjspea8NCLIJeNit
	id66OKbGkfjhAfvc04VtB8CS/U+4/KkpXzwjaTHNg5FWA0mQ8IBM7lMOzOK3Y7O3KO7EDxa+DAp
	+o88l+u+ec2Nno/KSysjn1u2kaZzYubL9f9uvO/xIw1YfpfBJsuvRhv5/JBKqpC3xa36zXNXfhP
	HV9tMY0zWZ6YdgjT4cB5mF3uCPClgKor8nzJLqET14ufYkPjpZUPaJTDEx21clgXOo8crsAmANi
	GLggTkGe2SezuG09vlWx8SZ+EQXbq5tgQ5St4=
X-Received: by 2002:a05:6102:41a7:b0:5f8:e47d:165 with SMTP id ada2fe7eead31-601deb1bda7mr821287137.8.1773240328571;
        Wed, 11 Mar 2026 07:45:28 -0700 (PDT)
X-Received: by 2002:a05:6102:41a7:b0:5f8:e47d:165 with SMTP id ada2fe7eead31-601deb1bda7mr821281137.8.1773240328114;
        Wed, 11 Mar 2026 07:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm3872241fa.33.2026.03.11.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:45:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
Message-ID: <mb5x4jspf4fwinimjnfhlf45gee2bajqxcp2nglqqkfnulnmbl@4lvhh2llnxjj>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfX2va9UjsmIBCL
 6mYjLrOOmf8xHh3WVVl7W5tw6ObxSIMpk0VUPr/aFNwWchdW4zeOS2qz7rTpY/MjvTkjl8yUlL8
 U5fWVfGvXzDJjh/hNWc6I6pgaW8dGgUE2XBOpiNHhGh9aeOiztM4kTxT0DSGU9BebCmSncknl9I
 QEMZr81nzcbddSOsYzqrIjh2WF0LI3oGz5u9m4HEVhKKt0uiCFAjb3EkyDJQ5UOyJp9zqVd30GF
 nuLtLOELpp2A6xpEimEck32w/uV3IUU4VkwIDnvLLyEsv0aCP41U53mPytp2zEwShlPPlAC6xUc
 fvlUBRJxGPDH9vMKqAzMajibWxjEWqZoWrdF34KDC9yi8hXW6o3UU/0lQ5zCB9GEK53L5xzlWoo
 aUk5xRd16+t/Go1MrSN0eCEeqekY8WUovJRsn0ioVFhV7kOFmF1iCiC0QwZF0TcXH0VPMdTAxGV
 pQqeKXHiSfTlkST3SDQ==
X-Proofpoint-GUID: YgtHmShyWYycXLC_GBnI412C1hrmmj7N
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b18009 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yEwgHnYd1rMVcNmT1VcA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: YgtHmShyWYycXLC_GBnI412C1hrmmj7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110124

On Wed, Mar 11, 2026 at 03:15:46PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    8 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq5210.c | 1156 ++++++++++++++++++++++++++++++++
>  3 files changed, 1165 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
