Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611D17A31E
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314469; cv=none; b=VZCmgKNsyQ+Rq5FkAf89+X035qJCwSLRCVHYS4KoEHlUI5csWMnYTI37DmJVTiwwuT6BrfG/HgDgxfnZ3Be00kyeN1+3xUKUBNm1zBBzT4a4zm3O3YjaqGfGGaL4gl2MWdoNqRNxsMF8m/IZ0+lbMhJv+JYHtpzOlvjFYQMDN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314469; c=relaxed/simple;
	bh=NeoR0fPNxCSdzYMkdOI+2qYm+0DV4Tdgor4+2UlbwKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpT6Mu9/KdgmIGKZrgjtBd/T10SN11pnk0MbugkVHuoHncCJIM2ABdePKoI4meFBjg6fnHNVUa6d8t2OfPpK/U41HwALRhJsWDePOqB/DW1hf2CdelLNUAH5OzIVrQUZFb34kb6gHz+eTCtnb9RZRNYqptu/Mk8Y455Tmd84FoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCaR4Ulo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGl1Mqja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCaR4Ulo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGl1Mqja"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDc1b4164893
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=; b=VCaR4UloHp60WWR+
	ehYYYx1BW1Bzv2cY+oxJUBYhYX+6sN8bJ38ubUfB0K0jw0e3/Gy06T/+WYamOrTr
	zmE84kHRFVzK/Bjy0GF5uCAtyPA1mHxZlXRTqXaasp5ZdV/jbFkMP3HVqtErmzvU
	PgqCbmgPVafdjWb5e3YVrkBxu6Qgj2Pa6gODu0sd+CUKX9pvVkF/bWA79blvNMnT
	v/bwCNe5H/Q+hIQh+8DD9/7038l/erTBcVFlxuYl9FXoQnPy7vyczX1t9SIQF3bq
	vqAL3oiQNthAPGPrYB0D1LFbKYDNm5q/URBkIDvwJGFCPrknnSNkLd4WgjzmanVc
	UziIrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06rj7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:27:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b5ff26d6a9so157711885a.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768314466; x=1768919266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=;
        b=BGl1MqjacM2V6v8V1LHSNHmNlxYDyVNMLjfX9qE8szgnD6VIQa3/hhEebXE9a9bHRJ
         BW07PRUR6Qm7ZTOq1yGquD7Swq2cJancGcnxhcV+SU3G0uTwvo3Fgd2elbVnUUhsAWto
         +p5Anbmo2ISVhCmsZn0aOlNgeavrb2QL9I4ABS4Crj/dfrUq83AN+RtYzKQSh3dmT8lv
         lHG4BmDhaNgavKi39m/nt5AFMk/Yj7AGOIAFopEXbPhz1BQJXknoxUsE7lS86zMkquyG
         ay7NnsTPb1EOmHgYUdaNEQ73dDxIqMH7By06wuGT2MSNfZK6VhTp7dsQ5d9kbrRtVVnK
         lGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314466; x=1768919266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=;
        b=FMNCP+Ifttiv9jfGblr8vvUkaJTF/I91FD5k6ei/827T5UUqJJbHAGGd8758qHtcM3
         Aanc+GjShdluJ5SABTg0rLiLDSYAsJ2ELq4zvoVofwRfnrq7YwCvllsyS9W2x3s+RCPM
         VQVGDgFRWaz5oUgi7ji2/YzhcN5Vy8TOaeOYiirkUc4Ake4vQ8QDMK/Ks0NAQ6iFIa7s
         d7e0qcDbUFK+zAx2L5IpoybFWk4SsqGkVDCD5xTNrPaLMCBr+474tMzSv6zK3uhApCD+
         /woS/Fp6OFqfAnXRz4j8u8HaSchbq1JL/Wa+w7zRX1oOO0ESosekUJ60nA0zRiLvbMvH
         6FDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi62esXLJZwxj9HjIrgRRpP+6m7ivL5WAk30gjsUvlnWAU15O2qnN1K1hZj9DN+tbwKqe6nPfa/2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VEdklWnU2ZHtn1ExfuSpAx0zfCOLBcohLAjZhFW8bdTPw0mC
	N3szJBu/6q4stMtJgbFeKKE95WCzERUlY0X0GlZWiS77frOX42lzkq2hj6lmAj+wytYPvZRjwU9
	o8gb+ELjQ4X1F/wWIFV9kEGw+dIzjeamRAdzHADIK/LP4Jplno6IlEPQTLBEEWpA=
X-Gm-Gg: AY/fxX54vm0ve3un4oEWe0B8j9UmoKndtLuO4auEFM/howIHPF1YSyxtYTz2jWl03p5
	Fcqfx8OmYAniPlz2d26b6dAxSHWIFarQYeFSUYzQ6COY6/+Hg3mKKrXuCDpcWgGAcGnViSeoF+f
	wtT14lM16Cyj38b7dnmkJgbbmHYGcDpnusupkTQixVTnhcG+2gIvVxYPqgjH4Ifdr/tLVmmdC4a
	gJszBDBlNCa3wpQCf22N+8uGxFVAQlUk38bl+1QkXJW9FVRsazZ4Dk5j0CgCsPtEFFBNPyAtcAu
	8tOQyDdEpjWIASg1pvaPRpZVBQqR6msXiTMxSnaDLhH94fS6kAZdPzCPiZQm2bJWB/cRiMyMI+V
	a6SR/DEYrSTizRVzIq1Ek3jv1yUK1bL3aFmh8V/uHaiWwB8HvOjqTHC7ml2WvljLmoKU=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr2194980785a.10.1768314466546;
        Tue, 13 Jan 2026 06:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHScso/L7ys71AOzWfrACJ67yGq+O1Tl0268Rco6zWp40zeSyEB9hK9SwA0CE9pEPkDciaQFw==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr2194977685a.10.1768314466088;
        Tue, 13 Jan 2026 06:27:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f9a9103bsm927560666b.30.2026.01.13.06.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:27:44 -0800 (PST)
Message-ID: <f9bdf491-0809-48fb-ad81-18a77d98ae00@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:27:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks
 from q6v5 struct
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sYAOljGmjEFvvpavNUhqTAoeiVxciugu
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69665663 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3QIJbu31o7VC6p0Pe9UA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sYAOljGmjEFvvpavNUhqTAoeiVxciugu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMSBTYWx0ZWRfX9AKr2g0v/SsY
 mpknSREXgVo05ngDQ6wHxVS0NJKYnahKiVVpX+p0/4wqEQ3w8srcyIZBqqZUy4/cJChb8WvSHCY
 JWxtTDiVbIAZuLEMmq87hsek0i6o/HQ9iJsB3fZ6Jbm3fRR0xORisGbSHdrFuoM56xwyiAbMSIz
 1QLlyGMLnRiDxOA3QEcJJG5CTdQENdqPzYrNGPB7veMGGug9y2ujimNq7ar9WuuMkvUBFI92wIz
 gAV72vkINsN1WJPnKoDvheYBlMiRlr7GmmxMhIIuY2IPecpWTNcjY0Gt0CYWuj62ZL+Pp0F3gq+
 LnEdx61x/XYtBT1+7TOYfwJgH4OdKc4LjMzscR+nsVGvdjVIQ76yJzwxV+NQT1CQOvDD/3duKF/
 oTt+Z5kbasZs6gZQmgnyWJWsEVIlFBy23zPtG2eozb6OhRAg088X3EVNZsQvhppTeN222C+Nn/p
 TfhLLyeP52AqBtGbjqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130121

On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> Three of the clocks from struct q6v5_wcss are not populated, and are
> not used. Remove them.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

