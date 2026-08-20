Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A73B9D95
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222684; cv=none; b=RwrOTdjPevmpCfqkUaywFBT3/6lmY1oA+EBQutZLBrQR4lfLvt/m8w61n+YHHcAyX5ejHSKjkrWl9NxInCluspw2dGnGFqpzDtJ5hXn/kJlpFf6xRmM2hDs6igUxPWMlYGdipLTDe5vey8uyzP+SxF7hfBiapV3gqy33gDc4gNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222684; c=relaxed/simple;
	bh=uS8R5k5DUGiB4RWFV7NfecEY2W+Azrnzk3zjDdpSSFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS8iHlFHJASZ9vnxNEKo8qJyeUy+NV/rIDi3a9b/d1FKdfw7H7FopPyltu+AgFVwhqmEURfuAwPaWUdcBXSgqMeEemCf6XdbhOATPCem5/z2unj/LU+FlXpJ2wxfmqkpK3dol0pyHz4nx8owK5DRJ4FvWq6wiUuguZTjnGUSy1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chpmrH1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMWA6vA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chpmrH1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMWA6vA2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2lsL3132006
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnVSx7Tmcw12tDoP4W0bdH7G
	FQGNd8NMsnrM84MuWbA=; b=chpmrH1UlJLPi8+zPDzW7svC+/o/M2gvCkEkbIo2
	W+DA8I4kUjkQE7N3etbs1O6e452zJDUzz1f2l5nG1/BmgRH1eFUKZ8LT0bKHvQrB
	mpULbt6own7cUNPEqeB3M/v46knhHCuSX/CWSX/ZTd69q+uQ14QhKYIl3jTN/9Xt
	Qz9osy/BxUXtENBL9WAv2bvkhKrTwHIiIsctWfpEb0Xe2wlpYz13Ysb2GDutrE64
	3LMiE3BCjZfSA63U2xmBMRBCPbeqgyJsF9hAF9eKuZP3ZL4j8caS1lYrrDTTy+Si
	PV0gsUD7aEALS1qc6oUhzViJCft+dUgO1iM4XB2OH1XvbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg18572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:44:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934979ee9f1so262475185a.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787222682; x=1787827482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnVSx7Tmcw12tDoP4W0bdH7GFQGNd8NMsnrM84MuWbA=;
        b=GMWA6vA2gqgB/dcY20ihgjOhmNxdUke8YsUAMaAryPCTZiGG8+J6NMNgv5MNfWO0C3
         AerefPJajLIgmzRbAMzIF2SHJHPnKfGqn5nJObgo8eb4ZhCl6o0sxaBAutFi/1UQiTZw
         RNpz8suIkl0IIGdQzyDfXuO5TL/BqiMycaypxuqNirARVKbLk83DRamNr/7NDZ+7SyZX
         wv5s+of4f7Lvtj2O974L5EOTq4UswU2hcM3fStdhXsgSY7uDBc0waSrFQ4/XM6ZMAqrg
         edzJ+6o6lBrE2UZJYq6qagpQW4NwIkM31D2gDeAlVcaqfUpOCh2rImPziZECb6drqrJ2
         Vxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787222682; x=1787827482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnVSx7Tmcw12tDoP4W0bdH7GFQGNd8NMsnrM84MuWbA=;
        b=CBJIHKeeRqWlyD77o9XAsGPNeL8V1bi9CFTte1Lj00tOSLnbPWlDmxDWmTD0nDFtjM
         g3voBMwSjqektCuV+BSbvfpm4CVdZjNmtiq2HzbyC+2SLalY1zVt4VWTZ+1BT48iWyfv
         KY90OOUbfl6lWJgVa1s8yC2llXG83+kD8TtZUYJQmuKV53TeT1tpsqipuXKWOnBkdnR8
         TsA1LAhITKvIOX+Lhsk2cicz2BxeaDlyZf/5i7J+PVvITrF0kSx28pw9Bvh8hi9d4rfU
         uJmb6i+4sBI/ctboUa93iWZzqolD4G83rncRyFvVuCV5AzvO0b7q/hz46XfzIuzzNcvR
         7vlw==
X-Forwarded-Encrypted: i=1; AHgh+RoZDQ3c1gFdBp0EYoY2dn7sFT0/m5NjS3UG1xNnU1QNZ1yvW6PdokoTknbFcTPoDMqOcEeDppAvnLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA13l/4Pc45JvuxJjnMF6COnnLx5dnyGlnijT/Okb2ztfmOy2X
	uJFo4fJ9HCr1lKG7nPXUx3lYgV+3p2IZD21cCiuJdomU5UMM8rcG9chHQ81T5W195MZQlP3+tre
	ez8OkWGuFhfnmUc5yfEuWXnpCmc255s5F0oJ5rIbRY8tcK77VefJfSUe5eBjhSBU=
X-Gm-Gg: AR+sD13JZvrlEW6DtCc+qFc3htXr1r+byHX/qTIxTcuuGLAo1supvNU6AfiEEIWwO8z
	C5Jtru7b7zXbK3MdPcQiggP7NQ0yB5AfHocp0A7RwBmcT8iCPLadihpZySKVOBplBV/ApclL5jT
	tTlVfQz8PDHJyypNAj1SeoXUK3In7N9Sls2E71z1qenGoj6cL0DfsxNzVwvKq7aNi5h1WnzloiB
	g50y6sW5Iy/AgNwC8tvaKDbN6Q0MT99+4xa63b+o9IGGy15dXTUyXPK0DUJtG2zi+fLZPYfFzpL
	QrOv/ViB1W8ZCMjMFK7qiqaXTrESh2nQar5cvtEFEqbEm9pRGJVVA2tVlReN+tr5bxODeqlLDYd
	ApLRAI4QMu+Zmr0E=
X-Received: by 2002:a05:620a:4886:b0:92e:76a1:96d3 with SMTP id af79cd13be357-9371e6ee8b7mr956447585a.34.1787222681643;
        Thu, 20 Aug 2026 03:44:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4886:b0:92e:76a1:96d3 with SMTP id af79cd13be357-9371e6ee8b7mr956443085a.34.1787222681097;
        Thu, 20 Aug 2026 03:44:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm12781171f8f.19.2026.08.20.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:44:39 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:44:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/16] clk: qcom: Tie CX power domains to GCCs
Message-ID: <brgyntyrzxkjoptxxanjwhrs5bku63pvp3mubooecurwcpg56u@ctymopqzu5he>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BiiypU5cYUBR1NCfbmuj7IWdSL7wX79t
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a86da9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=N2DKuxuA7Gt9lniwrZkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BiiypU5cYUBR1NCfbmuj7IWdSL7wX79t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX/4iMyKyQPuty
 FyrYtVeM1T8Y6IKj4MKrA4c85B9oR4pP/NC1WKvGYXTWy6y7UhYv30+DBJr4BOgZztrVsxm+L1z
 BZiA0+5wWh3lY6HF8wEc25QKCJxd4M0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX668fCu7+Un2+
 DkZpxzeJx6bqeQNA9rVbQ5n46J6DjrRpuMQHl5g/Y2va1cznqmhM1X3zQo0+4Vzyq1ca2B1WU80
 Hy+egm4836cx0g/qiV42HI8weSJ4JeMPRjKkmIp9tzp6pwGefFm1iRGZ6Pd5vF/uLSupuGRuca7
 S1gncQpCo9e4YgD+Bmmy+4ekU8pYN4NigVZQZ6hotct4kjlbSLF+i/dfm24JC9gz6RlPLhLghBT
 +/Q9B6xdgZlIg9lRqgGlfYPQBvpgXm1TwZ2c5s6c+MbUt9YK7dtYDnDjEdc7qusAHXXYOtjgWZ9
 MwuNM7ryxQOa+hPZ+9bHmK02lDnqXMPsYvkGqYC33VX4tDFY9k+vcCgYF6GH3doQQ8WEtg7XlAM
 1s/U12e5DLBg9N8DhYYay3MGTxb0FwPjiXAwULsNB0XcCfMLT5NpqJYbpqyJd+qowV3mDwlZ6oa
 JdttohStB5OmEE97Xbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079

On 26-08-20 13:07:03, Abel Vesa wrote:
> Tie the CX power domain to GCC clock controller for SM8250, SM8350,
> SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.
> 
> Also enable the runtime PM in each of the GCC provider drivers.
> 
> The existing common GCC schema accepts the standard power-domains property,
> so the bindings require no update.

Argh, this is actually incorrect.

Bindings need updating.

Will respin.
