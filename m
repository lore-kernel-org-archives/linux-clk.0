Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655947;
	b=DGbeOFC8dn0qNxQor34NMLWU96/Vaun7DrnCraTAbQABpj58kqk8zwy6vdRuVXoz2rqi
	 jQE7ntCif4R5fjjkzO8v+wHP1wL0P+AOxEI1VUzbV8pLVqe51t0SGkMs2EfuQEx9UEaoL
	 V/WYnK+lgHFHp1jpjrq7MRfu+cyVJfUBHpOAm2W5/Qa1jBuJlLVB3W2oheRDXjzoVGR/r
	 YqrxOBMWxXEPFAErkErPvBakn8V7q6ihHyw0zXDefsHDOI1fGseiXreiuK/CkG6nl1GON
	 hqEmKF23KNUq7yI/a3mkKH8FiXVhqk64fUiHxGgzc40ytN+Kg1yF1wHMExcpHyLjMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
	b=yGVadPBKbZC1C9lvO995G9IoNguhOXyQXxpcFsHZVGusr0Ole8l0dy4XzS2qzeph2YI4
	 RxAxEt9Mt6zo6gVvlLwqz9mlIzO8RlgA8WE5FVDGZ18YQVYncZEBpjM0TeIEh0MuyBfix
	 oOyMT7B1IBunTPkMuau4pcc8dRqndszK/A9JAlPVNKvaD6R/peLNztQ2YujdDZtOBmYsj
	 3OazozUkhZsg6E8edL7lXyhYHgJBWSgYwwH9eFaluWjt6wJZNgZ2OwoPHCGpNjv/AQW1O
	 tEJB7hR+o9xBnB+g8Skj/f9G9QFNCrfeYEB2Q8CTktpEadYJUzOGvIlcg9V9rNSiAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVCHJWYs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Se1ay+r3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B5606A31A
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVCHJWYs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Se1ay+r3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701qe2714181
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=; b=mVCHJWYspS+BVcex
	/WyiYlvytC76b5pQN+tQBl3JiwphHifBZksIJY1q/J+ChX2eQ7SkDu6NCvKTqkKk
	2mr4ZSZx3Ud8WEDVzfSHcAPiPyXj4exPQHyRP7Uw4kUy4R20YOGfXG7DWDcCYTKi
	reJL9SR9GiEOpVDUvvqQpvi/BZJ/HsTiUrKGHPMR+arUrqZ/ibLuWks/8OImPHYF
	TCw0Jgq6syF8xqinXZmiWyUW9wjsuXLhQwD9fnBzyG6VS/dlPJ/W88QZE2Ktr/MY
	pjSXlPcI/FZnyyF5k5DpQtnD5gYq87WaZXc5dMzLD6Mrjpae6+zZAw2cTcXegbP8
	W3Iz4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsawn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:59:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso27887885a.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655945; x=1793260745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
        b=Se1ay+r3gYDWGA9J0x1nf8GXQMfBLWPJuXvPT2C/WRDSj9PliOmeuXjRONfCi3L8Tr
         ncdD4/DYWTGuElSpPyjN9HtQsy2sNRg0xPgDMLXdieWWu3SHBX9+VSY4UbqLPX4S4LmK
         STX1TABTz8Dc7qKl8wyKYauKIRNYaxmZapk2qmheBsdXoZddruPw3S9UGj0oRNXce4z8
         gbEBSXCfWOZp3LC0H+urzcpFp639vOzIO93KAnBvIesJCzQsDeySYQUshGdwBsNjpzwO
         GsifFC+u4TVDtV3dC1wnGUcsyVVM5q95csNi5LN/+tsGcGgt3xscdaVy+Zu0UrnzJt5y
         TUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655945; x=1793260745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
        b=wGLPQ+jZa351qTpbZV7WM70n5aXQKt3Q4xwJx8dVtplxYsGhUmO/au9LPqhg8QzpMr
         8iqIu3Da3qCJ2zszTVBTECg36jLgrFnhsCpGShkF8jrpwjfSXPHZr6irpubkm66LlBvi
         v/mPB8yQrS5DON1vY93FQU6UcMv6t7cU1qauyf209EcWNsCh5U1Umh8DXnsXzRAKxi38
         65KpvgOMwMF4k2+7neNhTgwl+wpIOooUo3KKOYpmP/o0pkYgL6oGRKXSbZnuZmxTIicW
         supntggL5rlwfaKpbboJYYF8+y1tfThnEFOwM5mNpo9bwMKhdGa+VeoCHREfl3QnTiXO
         1NIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRPm0q7beczJiSGTTQC5ssHSwz1BbNhnTgbGE0kOZsjR9nCgtCcwW2gyAQtS8b0G1FS0eEPEWaBuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaLaClS0Ghb2+JVoFHJPHypYQc/ZhNuZM3398Hn4O9WkglwgQi
	nvU/Mps1B1TJtBZjkQ4sbpaY17Mh9uWKLs8cUBtwbBy2yuhM9Fj8ZgdF3NVtfqFbNXycfjn1jP3
	bxXsW+6dcOXnvg35CPVmZ8/QfT5D1u13WT0cqSdAkUoGffNcpQOi5ukn506J8Wz0=
X-Gm-Gg: AYBFou28NdOQG8s1sswAfgy/i8PCZlbIfOmd8c+8LBx+lVAaqUHk3CZVGTx/3J9So5x
	3ofnoWucupTlyo+zBfGsiYG8vnCArpzvPS34V1tuNh36grfu9n5ga+Y5xy4IzijH2xidaSWvWcl
	auorHbMaIXKR26cUL38D8xaGL53HPNBw7GAkhtliq9lEnMTDpq9/nt2UgT83oOFNoW44IAa/4qt
	OjiDgAy9m3f9tLtvv1drqd0brfW4FKaOnVrO9Ud3ULbJHA79Tq7UZe71HmXFz/BM4lC3ev/ImlI
	xmPkFMhXuNW2VMBIt3tca1ZhC1bk3AxkbQMeeGOP6kNh4AlyQhAe1No+/jVAw7KpAStkfDQ3d1t
	lQRBggtebXhg0o3dcrckpHw==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr963760085a.3.1792655944712;
        Thu, 22 Oct 2026 00:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr963758085a.3.1792655944376;
        Thu, 22 Oct 2026 00:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50b2f8sm79996666b.21.2026.10.22.00.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:59:03 -0700 (PDT)
Message-ID: <d8279746-7abe-4dd4-9eab-8137d2da19d5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:59:01 +0200
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
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs when
 they are disabled
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-4-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-4-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jKvkXLBQhAyProRQ0_jRct3ayzn5ch3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX6WBVknQTFcfz
 yj9LiWs9PYCNEzS1gQjq1KVW0BtqY08dOGuBpx1T7wcKA1/r7OaajJCzHQHljLht7w6hL4G4gWA
 eGQr5lPHYMZ8Qlptmu1ptJ/+DmiWCCvymI1fbi2QP27+/wsYZvT9pihFNAl8aTWxWFBKobkiKFP
 P+DQhksYLs4Gq6cVF4MMl4nLG4/OgtHUb4M6ZU2/GKufJdyNyHkSkNj5ODZhcMPI7QVPCojbjK+
 +uCVtfcv4b7McEdzyNVnaCC9olp27XQg9ivqjWCMHL2LGtG3FbUEVcRLGX8kwmaNkmPk2kScPEE
 La32JZuJ1dgJUiHtz6hBtMyqi/790Bo+6x/YCjBzAyn7dn7l2IpXd6bAc6HqgScFZXLG/Nlj8Cs
 p/YUia9/SN9qFtF+LhwBlf9WyTAmULyqfII6ypmqsW+r6CQPfzY9fbacCUe4odR9/LL528AxRS8
 tvu1WVLIbGX5p7zYQ/Q==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9c249 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eDe05lC2xiAZV-bDqWwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX6nhu2j8Jcfko
 VqVMp21RHTdwV8jFtUVqaicL3apP+j5C+ZZ4Aa46nBCCJAyxp3HCSlk+x56YFXDBPR8MIGcrkoQ
 edWHykIHTOJ05VxhgnbyX5/Ob3PqpDk=
X-Proofpoint-ORIG-GUID: jKvkXLBQhAyProRQ0_jRct3ayzn5ch3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
> on whichever PLL it last ran from. When that PLL is turned off and the
> Titan top GDSC then collapses after a camera session, the SoC hangs.
> 
> Switch them to clk_rcg2_shared_ops so they park on the XO while
> disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
> always-on sleep clock and is left alone.
> 
> Tested on the Nothing Phone (2) (SM8475).
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
