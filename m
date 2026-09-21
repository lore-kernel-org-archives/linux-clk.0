Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8DA493D25
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992407; cv=none; b=m1L3wF/JXlTzNZG+hMy1fKFWdt/z3SeB6noRW9qz1tiRkp0YnH2Ov48y+kqDgEn+fuOkQRvAD4WSAMcHxZYbERtoY0bNlWfOypDZjhHzsZyVf+Oxb9mc5UJqvmnEarLIBOTS0pwK6IatH2Lvigq+Lc7mSfKnw4jvSyt5noaE+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992407; c=relaxed/simple;
	bh=8y7/zMoAU5J83AFr8Wyv1UTO4I735JbfICWLuS7AJ38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIapmUwBf8oPak+lgK7PRnZL0i59EPHev7i9KSMjpnMsfX3O13rXycyXolApKYJ00LAyyfOxlKTWA+j/vywCDDmdHtq5Gh6ZODYzn8pJfCmgy9861GwFPP6dgOa6SJiFf0wmy6dF+kbEvH8B2HWcUxgMv07sjoE3G8yCkDejef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY7FEHMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awXAjIJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY7FEHMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awXAjIJg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdx7r1563459
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXBRdDppBAPCJg9q01FQoe64
	56Ok5dkROCyGIu6mvo8=; b=jY7FEHMHa4U5+m/pn8RZKDGeIRm2gvbq9RvFWkrQ
	0tL3oM2j7JoLkqLp4VCfGn5TTOo7ZYBMqF0sZw6t23msrINtSQo0MC2asvJZ2WBi
	1pJEThWv7Q+xq/083llZ8gDAIYLVpUHufo5mtmjOa6NRdHMttuIHymKtIFAsprG0
	0P9A6y8VStBGGu2aRXrfr2IQ1dH7QRA+I/xAdFwoV/43ADSUGORUTAZRXtavpZpT
	ljabt8l7RHduw/5X2iYa1QIUyn7R5WcvT7rOAx3x9Bh3eyDZrTrOhZAZ3/VRGAvp
	l4Bypa2IyS+u1pevZHakPIlvam913mON8T36LmI37QMhTQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw16av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:06:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a532e31dadso2702920137.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992403; x=1790597203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXBRdDppBAPCJg9q01FQoe6456Ok5dkROCyGIu6mvo8=;
        b=awXAjIJg8HkMsHPROe95CkeKtXoh23ce3G50kcQJXTu2Ai9x9gX3Kr1Yzoe/cbZhb8
         sodXa9LBcrL2pHEVR3P8A7Tk7PzMv3GNQlQBMHNBqjabnSbuXMfxKunuhVPv8bq8hDE5
         qNVVTeoLyapwtaWepycAQjHjIau/3EATj4VxWu5u6KFNGwzq9SG6zl+i8wTJmadv82w2
         ALY8qEpctPNDsSAhBHJiNcDEGzm6kk5OqWlhIVQuKs3DKDSSxPkBe32H705lfrUVIisR
         RcIc4zbavGSOEo1kLDAX8pjyNn0nIAyk+MFBCh+QeZ6vUfPB2hz9R7VHXgDB/5SOKJNS
         0VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992403; x=1790597203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXBRdDppBAPCJg9q01FQoe6456Ok5dkROCyGIu6mvo8=;
        b=dyUklYx967/4Wgo2onD0hO6dcNIHRXw6Bm5ICU6/kX8xBgPG04edLUZwBJjkVbmCtM
         zXIPduEkD+B7+ntxeaCwhlJm70iYuxreLwd86/GpLMvcDPAEaO6i5WagOYeu/JvNViPB
         x93aZMmSL9JKVUFDKv2Ln0NdbQ0ZIwjF0KWDDthu9nhNBh971318oPZnhP1jZV+6Y03r
         5Dr2TohIL1NYroAMH+PHqGvlTJFb1bWdKQYZys1wNyCBKywLxI9W1ZRUJbaXWT6Yi5ZO
         ficA5kW82/imibanwiUlrgiqkPlKus0ipplKj4V3uSvQHMVmvizBANxrn8rglChax6bT
         DcBA==
X-Forwarded-Encrypted: i=1; AKwUvBzaChtWflHR2BJRpjFvjCEE6telCAaz5gJ3q7zRk3IkMBD1E9/VdWMMUrpfIScdKXXu+XILHb2C4gc=@vger.kernel.org
X-Gm-Message-State: AFuF++men5AbuSvhAh88IUFvQ+3EnwyzEABEoSFjsg1k0htcY66gco5u
	C8zR8VjhSFrW8fc2SmBSLAdeq2Q/AjLX46wvCzddOT5C1q5oZATnduT361ur051JTU9sXaBOyJh
	Md2LYcXntDXfXlwo2Rq+yRGJBjqGgDephAKmhhYwfRFx3RnSey7JVL2GdDJTGMDo=
X-Gm-Gg: AYBFou1v1pxJHHPfv23WKePXLbLNLBjpRhReIsTD486NCNQA/ngVRYWKbzRiDOGOhcT
	vMKj1uJyr/wHqKC4foxRMeH6Rtdsb1Zodh5X54uja0f3fJGdquIp5nUWtYheS0TdKzI9V7HMXL0
	3QoyoomSMrgPqvGgF+8tNH/9qL7QZlUMOrYMFDT4xTp9lDGkgQ4RUApmTq5l4CvIfzid/pGbtp1
	foxVsHBEWRWWF3ypgcYypqFJoJWQ0GSUQaJMw9AYARGgMEflF0/WHEragna1Q5zWqvNH0+/a5P3
	Ts7MsRivWuxxahSITT7oBFBOMrK+IAECVfsF9lFS4iQi6YqAcbYDnfoJBnzvthwtvaoh8p927NT
	QkGZZ9XTTpaSZtT8=
X-Received: by 2002:a05:6102:578f:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7a6a25dcbf7mr2563260137.7.1789992403361;
        Mon, 21 Sep 2026 05:06:43 -0700 (PDT)
X-Received: by 2002:a05:6102:578f:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7a6a25dcbf7mr2563185137.7.1789992402738;
        Mon, 21 Sep 2026 05:06:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd115d78sm218942615e9.14.2026.09.21.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:06:41 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:06:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset
 entries
Message-ID: <itryi53qwodsqngkeck2ev7hrzg5udg4phmxraicmwngwhpndg@4nqxbftjy75b>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX/Z/g1Z13pYjg
 gCpXplKphdIcpFwPgRe/+t8AgdTGor7qXMnsVD6c9Op+vXU9wPVYnQC8ka4bXqGxzqRwwUGeoRr
 h7QQYIqj1FypVg3zwQphJefJETKvjDaHtS8APvfwGKmMA0NClZmrmwFUNruluM7tOcER4GC4sU8
 +ioTh8SqC9M3BIvXPocwlep4255XnMCPSm99DIaWzi7BZiIs8qzKznzk6FwGd/XF/cP1rIet6+P
 bidE2ehJ+9H//7VULFkui7HfXN/mamlKbQ8vOZr1MTW3qymxEK6Xd5+ftrsBGQJeX6q81Iw4V+n
 55JT4v1pTCzqXHIVTJub/nNb9uY9I/6iTXcyuOviHAs3IsYSx6zOH8Kbd7vjkiOBIZ/eYVqsntK
 6NQn17Hf8fgMMJjPdNT9bMUMm5NvDbgvTbotf5TgNEWjp+0GvtY3w95Bie/i2BjXOeMchoJmIV7
 4x/3J/gG1Ar+ZxekzDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX3e4bNMGq2g8B
 fTUMOl0H4jUmHFk7ifcNo7avVruOVhv4N8nKNCo/gTt4xGjp6l2/gq+b0tvvMRFHbFUVMZngUfH
 dx0xxDmRqjbbSSZ/HsaRIBXBKhS45pE=
X-Proofpoint-ORIG-GUID: Uu90cgWi1ZkWj-RrdAmIxIDmqL4rORdJ
X-Proofpoint-GUID: Uu90cgWi1ZkWj-RrdAmIxIDmqL4rORdJ
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11dd4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=22JUz5MsYadeaJqTxQMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:43, Kathiravan Thirumoorthy wrote:
> Add reset entries for the UNIPHY0, UNIPHY1, and UNIPHY2 XPCS blocks.
> These resets are required by the NSS block for proper operation.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
