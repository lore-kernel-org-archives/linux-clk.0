Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834775427FB
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953113; cv=none; b=qdYyRDZW/jO8R6qe09TPnngPRByaowa9+VPDCeGGDc99rJ3NDm35Xi9NerA7g4hNak+9vYUF1mEZiA11DuCf3yi17swFxacAOOekEaVF+5XdxsCM7asq9SoIxKvo7qZRiXr9SpDGu9zSyq8umv344OTBAlPhNzh0GoySBGNouDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953113; c=relaxed/simple;
	bh=Z09T1KtKmhwNLXiWVpHaJc9LPvi/1qHau6NWWjZF04Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ulgpz8CNlAfPXOUm01ZiMdqt6vbwHXILoCom08bM4Ut3pfZMtwdoADQcJ5Q8gyTTdMMEPZ8tl8heGr7hrMMzlkDtn3dMcMhPTlMN5vq/i51K/2UdCWFfxBQQgaoi5L1ZjCgR1xAnEQHXWMx65AcwzK/0lK3kWQ4ER7qcZeffrF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvu35bdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5+DQArg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvu35bdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5+DQArg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ApxZO1726232
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 11:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=; b=kvu35bdvj/2kTlnr
	AmEQcrS2WB3tRsgh3yjrsEXxH4quAHR9QtFzNCeisv/2PaZ9vXe4D51oR3/0PDtD
	TBewfHUy6GzQvW/8aOwW+ABXkzA3TskbuJ9l38r5ZIOeHHtQnKUkzo9vUqFEM0Bp
	KLABwX8LUA7loUJdhZmvJKM5mo38M9qdUo/bUusVf5dYjwRimfR0HnSjaxPlq0bL
	IZWJJSD8cttC/p+J8QPeXpVcZauWndKY6+DSGa/L+9+FXAGxjArMkgpaAWTI47x9
	ozQS8nZmxbiediOZTxetvFW7fxmSk6SKEig811q4vSbRpVMuPgRuhfjfzpNgq+PP
	iKpeDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0d87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 11:25:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso57158885a.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953111; x=1789557911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=M5+DQArgTxAXfsT8Uh7w/kOBh1ZDREBlVGPw/E7Q8w3Lnc48bkoedjNsKGy83QPBBf
         BJQLJSX4BvBHK4jcgYXgWqSnDqFkn+3SKaiDLO9NWb+6zayY7sQK9Tub0xm0sk7w7Bw5
         RVgQKPcVGAKWCrwHOnBI8LjWTALbOfUqk/QKvIcDEOt4KmxbEJC3Wm0zD1cNy9MIwpTe
         4gHriyPlYQRHiM5tHiVRYI/lpy2Jotqy2F813f79GngkeImcllp+DAqikpJL7dJdODH2
         eRVBtIz6nVNM0sJvW7FOXxTaKX6ypnR0vSiyCmJ5vGvGDciCRqnx4PI5F0jh3nLEiNvY
         21Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953111; x=1789557911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=FDjdSZrJtk5HwJs8m1aUnRfTUgkdHdJWSIicFmGz4I6TmQtbSmvYs0NpTvbpIIT8eO
         RJsPn6ru2aJKI2W10YTxq7dQbFAwujX0+R5SiIUExeIq6qqLRHZrBvhKZPe6EsKIDyH0
         UCmv/4xC7M/d3DE3ci7UdNkhwEqmSp0sdX2vgtlLFvEFxH1Fu9oaP6kPCtZjG4ukaubN
         6Prbru25YOrHRqeOfOcWs/BdtxiQAxlvlDjlA7wcJNnO8iR1j056A3TZkXndFKg5HY18
         cHFWCuCv2M1xMfVDYVLjtaupqzFF3mC/X3UxvqjZppUOiGMvtDYffCnYbSloQXli8+7G
         /6Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxHLj4nIQ9rML+BCOhTOL1umvaY9c7+uO84SK/pBADSdAENUtVqv3jCvPlXRawzW2LzbDAkaU7RIjo=@vger.kernel.org
X-Gm-Message-State: AFuF++mmevWf9HOvuB6myKXubjKlqh4tliP8ZiPyOvT1agupFdADGBwX
	omZbU0+ZXy4UtKeMgZuT1hy5PRDy5wYunR4Hrur+ikrf+xlPr/gBk3phaYWDPLmRKnO4IcB4QY5
	g4WGtTiIuokzV0DouGzQQOjO8XrfpUJnlb5QHqY2i6GFTumblwFlZA705zsf9x20=
X-Gm-Gg: AYBFou3cN1YwAmieVtXKf4FJiSoe7B4ux52ig1KSWP08dojNE2eBcLdcxH9y3sxpVyV
	fG4ZUu/kpFSg68YP87bY1kgPSbk/gH8+SAzAV7dgL4reKcq1db9F86AWF0aYaznROH2CxVJek+z
	GzwVOIKi8wH9vKqDacJxUCYT442RLuruj2GLUkMqsQ4tDW7GVpB0y2A00gTb++7gz4aZ0M4jV9U
	hRvJpJ/3+GIl+oU6oBbrJbjNK/9EU+M3vXDaJbls51LdO9GAYwGW3eQULwoYip9OnBjeDwo3TMB
	RYitzVOJTFkHUc+cwX2rFFV5y4tkUBxXRrlPpkb7NkK3LWqe/zCIyjGmcvzgGKwBR/8u1wVPRoF
	6geA6HjBXa0lBjU48dh56WA==
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560512085a.4.1788953106001;
        Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560508385a.4.1788953105607;
        Wed, 09 Sep 2026 04:25:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm545162766b.33.2026.09.09.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:25:03 -0700 (PDT)
Message-ID: <c15d4fdf-0e78-40e5-aeab-56692623b6ea@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfXzweunaa2zWkL
 vQpq1wPiGtMWnk3bhzA8N3DsJhjTVnJMQKEC2uPQqfKdyJRW55ZyBB4VsAVMgQc282h/nbeEK7C
 2go29i7Q899/bakEXbS9gxInyN8ojHU=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa14217 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: P6sf1j8nqlgzLdi4qkoK_-UrPoYm7p6w
X-Proofpoint-GUID: P6sf1j8nqlgzLdi4qkoK_-UrPoYm7p6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX8Zof+bUHPtus
 c0Mz+oDY7UrgxftelJsNgn3zKQomVFAW7d2OkezL5EMqgBJs1uZV55EGO7S6lXho93HNOkBujTM
 L+mpC0S++yIyb1WXffexG+INe5R5Ux5l6SlOqeSFHKWvdg3ijz34sypIRmtf8K3Z/B9ADkg1583
 5gPaOcoxFFNmaPFUgsHT40ILDPcVliN68/DztCvvaDkmPUBylhKfNYVJ1JdpMyxarmYnB0D1lP5
 jEAPSL3lkdqiyT5fbXNQdxOxWvkI+voroXI7eBhqqFGEZ1pPOIHs7Or4zzbHJTM64WqsWEoUkN1
 vB4dqLuUurBJs7hnvgDXA91p1du25FhJuiYEO7gFiy+uTzrWefQnvKtrksjeQneA3mQ4MwDsfjD
 mVwBNIlLAc9yohzZdRT/FVB4CY8jleuC+2SaPVwhxhE3L8DomMAO4t++H8V4b0sNPuXTsJwpYKg
 72YIjL029SU7qfrciCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090127

On 9/8/26 7:47 PM, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
