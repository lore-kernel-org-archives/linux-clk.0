Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461356;
	b=M7Fz1wXw5Hp82ykCMnt/HY1YibXxCbllBKPwNTh0lv9mGhiI6Y1ag40/LnxiaI//bYm4
	 Ov5EdpLB6BQ31i1p24MmDWj2dXiA1JoGM4FumQDcPfvL2WKuiOK7liifRgl8xT/VWy7NI
	 0BVH2u/SGyDn7/Qt7QhcQqsrJwLjxnvG3tjf+As2DQNWHyesEiVBdg8cxoDZdNyrzvxNG
	 xyLxHM+aMuUZLfIxCghkRuuT7FyYOwkwSHy97MEpPw9XxpgSz/hOgYnhQuUtPxACXVgrm
	 DYkxggL34mI1EeA3dvWS/aIJO6STrM5exw1JYFcoTqGylFsyGJHj71othqUkt9I456A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4xUTH4ApaOmDnbwbT7XFIBWNBS6WN5bAwQQKD0pEIsw=;
	b=UFnbjFVXSrBKH8yuQxOQY7PuMMH5Bd8DoVKdN3jvSItoC6vLPnVtMfLVE1zIXFefdDst
	 Iyv5B6/MqJKmhvwRAPZ1VhwAF2de/NSr80kEYKKefwg5SR+HURJa6UOapcR70BT/po/02
	 pOsbOprfjbw40nNNgl3qbp1bLyyFOOWECTuD1c2xamBDlbW5lOmH+dULQFogwu4GMvH+u
	 Aegfi02YcBohkFySuVGtEMm3At9Kb6dxC3bjXBhHRpA1/V6aBvqYIa0l+APWYm+qe5HBx
	 VhjG6aWtmHxckvBTZ3F4j94tM2jZLmXU5o7vmL7D1W71Lh+h88qwstUZFOT7FuRdUdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRApAcTf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRH6tQJV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941AA606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRApAcTf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRH6tQJV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpV82768984
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4xUTH4ApaOmDnbwbT7XFIBWN
	BS6WN5bAwQQKD0pEIsw=; b=TRApAcTf4ULfdmdHmn30uMkdi110ZHcLQnJtIbml
	fV5gFGFK6TfcPFZf3IIVKkjVA83ikFh+hxH2Xf4biFgxWMtNHHjlfoIuAIKAbK8p
	KiLdmbYXlz9ncvVKTAB/UueK5ATElGBYUiyOwL6vPlwfBUJbPx3x0awWImhpL+h1
	ZCCWu0CLL30lZpaQvMCOEw7yDiWv3l6cGfYKEoSmiiZyIcEI05n7U0qAot1V7pDs
	p7d8odtbMgEYlriCOvahZGmFnxiyUCGZ7w2bhSJhoCcSsiW4CpDbURJlomq4xeds
	ZBwDMsS6Tyfuj8RA0+LCYbqKa4IdLagFyL2kSceC1AjBuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb0xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:15:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fbso530814785a.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461354; x=1796066154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xUTH4ApaOmDnbwbT7XFIBWNBS6WN5bAwQQKD0pEIsw=;
        b=MRH6tQJV45ygaePeK3PfYL3UuqCfxrcilga92/QMa+CcDboVe8na0KaexonXNQUffS
         N7fN7t33L+HL3Kq6xcueE8fWDdEw75/KCnYdOaUjwRTu1uTP2PC1ivzvKpSbvQ4GpPj6
         xzTYBO7wI0Ndb4q5byzCsFaXlP8FfDLOcSp9moembeZW2/I3rYCdm0p48yeJaqi452TN
         j8GVcH1vk0iPTM0BsK6PwhYE+XZ67zX21+0NZArnjgXgh/wEeBE8fsY3fBJD6LBGY8rn
         vY9vEmWccCOLNKcmrgYM7iN7K1+QPaWbFh7XFbhS9mMWxxfqpqbaGT4gFMbsSKePI4Uw
         v2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461354; x=1796066154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xUTH4ApaOmDnbwbT7XFIBWNBS6WN5bAwQQKD0pEIsw=;
        b=hMC9moLYiwLh6y9cp1Na1e6B4rz3HSDzol6Kj1dZJDp9h2j+2UcuyLFtYxrIepYnyq
         vLy87yEz2mKKH9GWlk7SQa13ZdKFosGFAt/re3R9Rh4GuP8VcRKK0gQmP8618+XAYL2A
         n7BYQC2pjNzcmbuDrr3aLklQhJqNEQhaGxMNAWZ6W0E8sKOLeNYVUFsAlV+9nznXj3Aj
         0kbqK25kDu7AnudrPOnFF8QWW5JRtv7PYr66WHgJscy2/YFQXLldIbv0e6WLQDYIhzGW
         2Bo2qYAY/QVvRyTrwXWK62r3ecxW60+ym1e8ZgczPzQwKG9R5d/74ODcgmCJn61g4mtf
         35ug==
X-Forwarded-Encrypted: i=1; AL+hErHbDG2IKXJxZZsm0OWY1UOFi9Q/ocvdwY+xU1zO2KiaBnsnHJnQg3pH/QFjiKZ2UWQGRNZmpwvQHho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ti1wn5otjxjLwN8QxHW06xfRlb7h5a8BgbhgWXT1YfzthGdab
	lBhCU3HJFkFacXB5AL8DORnk1umjumXsTL737kHmgNhA9igZQlYN+Sq9/pIWuHV1q8ylAxPyNAK
	ZGLXOMMYfv3XqVnBTu6UuZlBwQCciXKVTqlFxkGm03xabQLggFBMUA6Z9ma4Os20=
X-Gm-Gg: AZFdTZcM+rGQ+Vt7Z+Plmzyv1kX3HKyL4A6tdQZsQN6VCVKDnH9KfH8XeREi9uJgd5C
	kTVveGK7zhsl/lvIDZtJCesINgz/q+RUbaY8Lia1pvldApbz/XAeTVMAQcAYL7+pjuDbx2mT+dH
	zcgWX5DQDmTXQLhXFeJlDRsTd4vquG886IkjNbsQ2m4Ro2iNMP1mCc3YmbQKwNjwaQdtIyqdg/v
	JtBVlQpUW7PAP4bWOrXlomAi0ZPeabmWCM4JZJMLK6yQHx8BZHoh1YgcDktAbT3aeys2OTA+VmU
	sHqmiVbsaYR0uXvXWlcfntvxFKDon34WyzIosRwpSrrls3zF97fviu9l1uCOjDx9hHzdoomchDM
	yluewtky12XaS9B2MnbIjiGRA6YUwOx1awombOhm5L9v3Q1QL9cRohWh9SM2IjmL9
X-Received: by 2002:a05:620a:1a25:b0:947:b201:faf9 with SMTP id af79cd13be357-949ba9fd705mr2093647985a.59.1795461353703;
        Mon, 23 Nov 2026 11:15:53 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:947:b201:faf9 with SMTP id af79cd13be357-949ba9fd705mr2093640385a.59.1795461353040;
        Mon, 23 Nov 2026 11:15:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm180466705e9.0.2026.11.23.11.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:15:52 -0800 (PST)
Date: Mon, 23 Nov 2026 21:15:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Set FORCE_MEM_ON for USB4 uC
 clocks
Message-ID: <wuw3sfmfdsheby2jx2ruy3jcyvvcmxy2dqcmvx5nju3hbf5vr3@cjzi77i63tvj>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX+ZJJYKxGcfyH
 xrRxOhYRgvwvpi2QKxXb0vbJG21R0wcCd8lWVzFg5QZ9lig5DJmGKdC41F90oHw78Q2aF51Lft2
 DXhW9p3u1BiBffRFZhV8HsiQjg3S8FTN1/4AMDiknwjVR1y9uC0ai9tt3TAIuLOHmVXsp7VO/6D
 K/7f2aMvLG3hj+vFHiVH2OO91qhEj0jiZpnfYlanWZ/TiYIdM5yPhIHOR/8NcuWxJDB6xkPXc14
 1sZvFyJrU2qXvFbNcV8foQRXaQ6GJQoOs3wpHZsSw5HgWmyhG5kZsVwY6+YNqVU3PyO/Ma+rGoZ
 mr8hdcR4oevEzExxVEhblX2BiV5V5BV8bwN8v+c8Ikg4FGn8DKac5fPWflNNMUPYEu/syDYu65j
 UcUvODZlnSQnn78TkLLxpKAvypGdXhA1SvtaeLMbb3JJPLUKNyiZ52wPbfF9AL6ORVmRYOB1ob4
 lY9zQnD+Swvxbm2qUUQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0490ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CqcFnwSyEhgAIpgsV1cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FICkG36iwe4XKxfmp6f2V-Hb3E0oV62m
X-Proofpoint-ORIG-GUID: FICkG36iwe4XKxfmp6f2V-Hb3E0oV62m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX5THvwPCpldCB
 9JvbgiHH62IkF00MUUKBcnuYM/IroCU4hlS9dbWYtIfUBz8CYESIIdtjmq1WJNx+jMPm+j67XDc
 yjsMRwIfZuGk7Dd2h/DiAg3hK3H5Gr0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

On 26-11-23 19:34:33, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On Glymur and Mahua, the USB4 uC's RAM contents may not be retained
> correctly by default. Set the corresponding signals to force it.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
