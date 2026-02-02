Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A82F0C5B
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064592; cv=none; b=YKrN9i6wsjKrJHwP7bvZm46flVJoc2N9zyNiT1DX2SY5zLgKHrSk0VblExGYFyj4DxieWMfFPUhmoCkibQCPXTxBneqs6rtDWlN4pdrVhz4AhGN74dr3SQxFHWPQSMp/W1uGw/mLz0i/NspsyGIkZ7rfF8UqpsK1lNM7zwDbL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064592; c=relaxed/simple;
	bh=cFAedMFN/XZ3dKYVnc/Dk3TOJBd26XbUVgj0LnwonIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBcTLg3JroVxrA4Cf8UhHnmLpRSxC20aDKVxAaLuzkdf/evLLcaLI3DHvoGV6rre1yy2BMWYO/tUcr7pAfAklLez6Vsr8CEn0W8CJjo89qs+soA2TD4lklPG59ZtSnsU+ppS0ny98JTVwwiXAsnrfuFR/PxDge3sazgBPUgO+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6WKG7OJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5+AgDD7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6WKG7OJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5+AgDD7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612HSv8J3744582
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 20:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbwJSPgt7gA53ZZR3Ht+lc0M
	HdennY+KJOsIXiBPlfQ=; b=b6WKG7OJCih5/90LNxwb83RuHxnzDYCvyAD3wzd2
	B4dwoe6z7v1jQykQAX5BtdUdFhms+H5K9j8c1ZOsfkrSRQEj6h56C21/KX/jpQC1
	Vhx3T0C/rq7f5/TO1RGAENTM6S5f1RsH0OIsQAoHV8Ie+BkBiuWk5IYcVz14eHTw
	NidojeiMHO0pSsybwLG0lL0VXf0tTKT8meHJwpmZ2jNCOImW1zUIhSou+n2cwRRo
	XcmTfGsXP4B8looyBOcPQEVqunermAWESBq8jYhvY1ElabkH6WK+TJXeDNLKqHuN
	YwAFp5AgaxnIzi81LVvh2G9Qn+JRlnNmauZVhnwiH6NJHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0sqq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 20:36:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50336ebabe0so5187971cf.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 12:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770064589; x=1770669389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbwJSPgt7gA53ZZR3Ht+lc0MHdennY+KJOsIXiBPlfQ=;
        b=b5+AgDD7eHZa8oXfv7D8oHKd73RR8K43zqDR5Gd7TwshluLgXxEc66sz+G59e48698
         O0DCMQgLwivl6FW7BEfOjypozMo6g/F/ME8ag6RByvZsq9pOHLlhR96QBixat1vyQ07E
         RGBYmnGEfOaaChQi/MDSLtb7ljWun15RAMdekAt6Ig2Kx+c27Sgj3HZ2Te+DQhfjjZ0Z
         d8ITM75OSnkiODNeWvo1MxQcria1PJ9NjhNa3wogdjBEbHPi3uJoejTQSIDSITnH14YT
         LQMwqsBcCiRbL6Z7SCkTXsqkP1xSP9xflVp1Czk3xDIQ4p5AaluwjdH06XwGN6TLYYB7
         PqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064589; x=1770669389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbwJSPgt7gA53ZZR3Ht+lc0MHdennY+KJOsIXiBPlfQ=;
        b=C6FutoxGSY60yuCKjlemzCAE3RUMjgGwfk9ap2Kd9YGqVLKofU8wYh3hUB886nLBnP
         vnp4jupw8Mvwl5MvS+FI6i1Zxwt6qe8Nd91z9tyovPKxHi+z0rhPPlcKrjyfNJApL2ra
         lwc42fZ9hfza/fnFw7ovZBQXjl3a0aeFvTM4CoT2zAeu+y+pJ1DFktjc5MtlQQnNUNg6
         12wJFCO3GEmfHOdVhzq+831gHN1QnVmp2Kcctd3Tv4HYfpOamT18MckK2rcFpWiEp+FT
         1BixKPHaEBkbUD+fYTbCYzu/ZFkQzDTL214Lpl5h93xPo6CuFUh00yQIFF1Ws7ov5Wpg
         //dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6n7qy7VlmcvCME1qWHweLHVL2Sb4lo1KeGkIn3kIM7fDhqtojPvJgmTmJE9V8XfupJZq08LQehJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRUDgAV5No6PtWDCey8oKp85O0azgeelEE7w+hud0jcd/mBFh
	NO9/Q2xHEZWKpXemjgnqWnhy60ajrfQ4vcG3WGiuSTBKnnLX8HMAqaauRzhoYothHtbFJB14b0/
	NzSI5TsF4Ar6SnL0xi0AogAaz1ToVt5POjhp1QUrdfxdkVOxIATBPIrrzT6RxYEU=
X-Gm-Gg: AZuq6aKV0zeaTw2ScsTeHEfy9d8S/wEO7MNyD1rpeeeUafhOuayxP5CPYT+QouJ2JVh
	Y3Ro6ioUW5FXnIrNtkOE5MbKWfdgIUxHH2o7WQfnDcKNWXWZWXocYPO1ab0mUGr1FLWOVm0qH5z
	XCwIP/esmi1pVbejCMqXz+vIuYEudFQpnlj9KjYpQLZIwGZtZVvJdOyiAciZaiac+n4elOY/bHR
	7s5oFrM2f4Xq3UeoBbYtFQrJgyWpiUi6TnTG1vndKibs/laxaZucohjyXYkQIC++KIi+2JfZkxN
	GWKDEwANoMqLQX0VZC9TQW5pYRIi+ebkhkU1T02VMj9k1cVSYsx6O4DToBNZmCMHwUk/EFZTMh7
	LWK+coUOhgJF9GhFvOimKSG4N1gr150luLROnSRgJ01gZycKONXOTWHNSd99eNhZbzx6nz2O+Rh
	bYWZAj3jC/XVTdWVnmEA7qLDo=
X-Received: by 2002:a05:620a:444e:b0:8c7:79d:f91b with SMTP id af79cd13be357-8ca2032ed87mr95559285a.6.1770064589403;
        Mon, 02 Feb 2026 12:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:444e:b0:8c7:79d:f91b with SMTP id af79cd13be357-8ca2032ed87mr95556585a.6.1770064588970;
        Mon, 02 Feb 2026 12:36:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c43e36sm31363081fa.8.2026.02.02.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:36:28 -0800 (PST)
Date: Mon, 2 Feb 2026 22:36:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: videocc-glymur: Add video clock
 controller driver for Glymur
Message-ID: <3y4m3c2qf6ysvkt3cqkatzklwbmxkoxmxyxfu2tu5r5jpcejsw@dqf2kp7rur3f>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8mdwCvbd5Bcja0Ye_wvNlQ5-2WZb1Qyn
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69810ace cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MSBTYWx0ZWRfX4PzUH5dN+A6P
 nsB0OK1hy5LpjzMNivjM67V7Mdne5992Wgn6bG0pxIVZ4PMrAY49L6lJm3o+AY4gb0H10qKa7Ks
 q717Y+bpEtEve/JktdpRWr0VUkXrNps29jQGmxZpDJjnU1rBcUo62mwa+fANJTsac2IuRFOuUrQ
 L0NMyq5ZD9yaop06T8/Q+ijQIjbARGYBivNXRMu8Cn0nip7+wxkn0c4rKdPgalk3jpTzPBK9mjh
 4Lt3sYAfP/9F+6LLhGNstT0B3Wa2PoBAct2JW7a5sqa/t5gAtgzjjgeRUPV+jTqFhd4I6m81YCa
 xl6V7+BoXYxTRejSgvHOLzTwv5S1YLzQW9DX9kZuauHkQYr9dm+YpnEPXDLFdXYAu+fWj59pb/2
 jl5Q34VL8G8DKQpamB8V2IJODRzzmZ2TZyP80XafU6XhnSkCytT6VWZOMhqTW8n8crtH3WzGYBm
 LRixJZeX4SHQm5cjiVA==
X-Proofpoint-GUID: 8mdwCvbd5Bcja0Ye_wvNlQ5-2WZb1Qyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020161

On Mon, Feb 02, 2026 at 04:26:53PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-glymur.c | 533 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 543 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
