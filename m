Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388553E0B
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128233; cv=none; b=Zi4sfKWAbdXv1HAA2wTJwDlraSUH/oyjWVqsC0LFdjSDiik8DAdEAxw5pqSimEgcHwxXyuwwD33uj+laiD/QKDPwur/ubNI6YiUSv5U0ZhqRU2WSjvq3NfRa1OiWFaN4EO86dL801uziQ4DLkdkeXI9qq/GhKR1OghN8ZSDUM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128233; c=relaxed/simple;
	bh=AZgc2b1F2/u6RSI6QEKCgbFDh6USJtktFy94PBtnXL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8ivN06sD4cNESv+zY99h7T7H40Ny8GIkqk2wDsopjeP7WZz+lgyLp3a+2bcD+gNmg1tyTZIRyshNOPn7YMttEkA/+3hvjgK+4uD9brXWAemzwf5rqOT1E3HhiI663305pGUjO1COAjBZ7llknn+S8a+u1jnZAPMA36HluNbKB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNpetfc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUb5HNfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNpetfc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUb5HNfj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAp93N773311
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=; b=XNpetfc4bchl+Bo6
	b8ZpG2c1yy4zneBUentp+i3VHfAv00IjnfKZS3lB/1KJpQ0EsM3pP8Bhlqx48CAG
	p5+cbX+UrzOuh6i6figo3M6vkZpWXoGwyKHM4wukaXMtx5NvijZegmVU0YNW544e
	eDCy6ouVQnfY0i93yKsl6M7PS/rbiRoVVJEJpvH0HVuF0NkSEisWkIVd+hW/sQw0
	P+apwlV2fNJLRatNttQPZamAAzhetHCBBKcJID4uvIPPqMgUaEm7BMfDfFV+Hcxb
	trBM7w9YbfkR4bTdqcE3Jjij5xY6mcj9J2xsVbzlWaEnYYyRJkS2mFqZoWMR5XYf
	0EwhAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h6bew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 11:37:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175bf22b2bso3606181cf.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128230; x=1782733030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=;
        b=bUb5HNfjr019HyEVaXfJM1bWmFjPc2Q1ZGjn5QGtXgo2VRKi/WP67YD3dtuHi4uusl
         evbJC3KAAmV524U+Ic7YdEQN3hISOOc8mgtdsbYOanxnGSTWF5yukgyiTrEvfHPwsz/U
         OADlCG3z2r65ZvfywPqzomBWTz9Gu2YYgkEFewQYian4bGEWzgDxp5xc2iqJpNLHcXO4
         pgWJCs9UOSJSGXzCdNWfxkICJGte4aVvYocCcN1bS1jvvwcEQANbVdkElN77Rc60JHRE
         8UkOm2OCVFMvJQzdMM2294jOfGvxJ2NVkNVanp0HCog6PxayhQ4JYFwqyfA9puh8caKt
         i7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128230; x=1782733030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=;
        b=ViA31MgQyuwWi3aIM06wDKu1gspEJDF5ytRpGhj3HXaB8R+Q4deq0+URCOXCxGyea1
         ysSuglxwSMZ7VNJpuWTatXG3qMeWkYizduySk+CnTvx/zagnIfb8auCvnMBxFZDkA/zo
         URl+PpjUgs894t+wFn8hEjAiNa+jRPZZfLisUpWYdMhQ4Pg7rps7Yc94fu9JNYv1pPdr
         XvExoEsvmJbOVY55pdQotya7WledBJNDtw5Ba/DjGUe2QO7e6Ax4AhDLymGfmnYFhzJ/
         B8ayhSTVNtySBNfoeUxravXJZFkldQnjaFdzcWdzBjDFJpxLNMao8cuTKr5cIxUgWsLg
         6COQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gwSN+As1dc/Iig7KTsHwc+UY3Y1ZIJNYs7ZyUa/hd/ijI3sFpraXpGHcVJPPnaUuZLf7Q9IO+5nQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLMW6xf9xQ2hsl97j2+eNM/beRI5+e9/tmmArsZrOoCCMNT56A
	lGSIOoKOw7kEc3d2s05a9BiKU3s9n32Bewy9T4uigpKw7szZJha3kAjRai5e0W+IqYDjYnzyXa9
	APi/TiqdajqLru7AJ7GUYuLsU04rCJGJLsmphNV2XXE6lfGK55i9W3jDITlU+ao4=
X-Gm-Gg: AfdE7cmhioKvZ0vp6rzjUq89hnEZG25w2l+ZcUNJH39ky45oGJbNs0ggwKo0SFVSpON
	bqQtKIWliU780isotQoilm4wjk8oN7+dwytOM8/hn8p78JwB/YUVGRuwCGu9RQRJYYRWtb9COcm
	Mhi7bStMM0Ma/4O8jBKnEWcgBq3eGzMjtjLunaJV/z69HkiTfw+eai3LsEfYkppePXYCifFvn1s
	79Ck0m23/5d+HV/7gUUh085qiRnxhyTUDhONLNtV35nJgoPTVItFvx6fS7CMGgOKJPkNiz29OUM
	3mOLmlVkpS0jcbaDBR+lgjYWTdVtIjFjXD3JetWoJdXWn8nvH5YwaCI/X18P6drK6Of9SmrwleD
	KKX9KI+NgPLvfGgQ4oPchFInyt9T3dAk0ngM=
X-Received: by 2002:ac8:7d49:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a4f417a57mr1324161cf.2.1782128229770;
        Mon, 22 Jun 2026 04:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a4f417a57mr1323791cf.2.1782128229323;
        Mon, 22 Jun 2026 04:37:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99978asm339221166b.21.2026.06.22.04.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:37:08 -0700 (PDT)
Message-ID: <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:37:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfXzqq3ZI0byicr
 1lbGRAYM2UpMs9lD/NzOyfgYtsxQ+V0EEQHFfydLvRb9WwdgBTsuOylVfIjMPdME4YTuEdm5mWE
 r8p8bhkrpqFotoj13tehPhHzy4qkHlsLqmHQSQhx1MyTm2hZUhzfQcROtC81Nt09uktQRhQ808p
 iCtYtlTO1MEXGLs175mGLk+VuErGma0KYc8xiDHKWdtcMt8bC61zh2uNUbctZcDkaf7rdpsA6x/
 xRvx0IWj7mKrJzMVV2cGP+51Uok9MeTgz9iWns6tp1KJuM/EyHHREMxLEjeJePjR/OYI+jr867d
 xJhZg7ktLPo3WBTqXrup0c3DpobQSwqCiM3aq+mBJdtzWDJdhMKjzXnsZVCHbm7wFXhlnbHSu87
 qw/D/1TqwN+1m5S8yqAdlkxEAAmHDsDmTeufA3wyq27ZjNyvxPgEl3fvvPKKImDMFRKpMPkaeAb
 4f7J9soGEakum/zyHog==
X-Proofpoint-ORIG-GUID: XuNNyzRI8S1QuVvrEtk_uuTzdOAY6PoK
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a391e66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=m8DMhdXBI9DFSf28WBgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX1xZDoHPnqGvo
 Kwa3LZSM7Io5kHWNfNZctZVOwcfuPEPcH5G3jht+AmXcKg1EF7s7kXfPOjCWNCe19VrTMlzXype
 H0JW9cUsW4AibCez+cQF8lmrFSr69nY=
X-Proofpoint-GUID: XuNNyzRI8S1QuVvrEtk_uuTzdOAY6PoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220114

On 6/22/26 7:11 AM, Qiang Yu wrote:
> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> directly instead.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

This must be squashed with patch 7, otherwise PCIe won't probe on
Mahua

Konrad
