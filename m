Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE23F8237
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326404; cv=none; b=KNb3AIwgLt8Whg3eMUObDw6peWOIZb584oZM/ITbLvYRb5+SDNEyweJ+J0PoZO/BGRB5u2Bp5NxZMILaYNmhpGsuz6ssUGV1tGVGOsde2PVE1hQotHjJ1n77GmJgOsoziC0+IJG78pKLN04sAm4sUIqsuepP1wh+WSOb5Y9nsic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326404; c=relaxed/simple;
	bh=q6xzlUdJhdeWHsxcxJhdb/T+j46cN4S6xUjdguAx4RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lC3QA9qG6GAHY02Rip/+kIe/YE7vCXdUNj0fok+6JlAcB9f4LslPE7G/+5ZjzRDBHtZPAB0nfxp26FuV1POFLOzW+/aDGq6ydlj7lkqGr0zt5SWnXdnOweUnokrwqlf46DIa/4S1KfIBwcbe3p/GpxFKi4uNF8G3SEUic5LCjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLqFxMsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2srzBJJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLqFxMsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2srzBJJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N3i84072472
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 08:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WE58upno3pdYgnQ1v2R512+O2faWYaoox0dr47816c=; b=aLqFxMsmVw8fuSNd
	TurUKbe5hfBhmU3U5uKL1Z7qWw0Ll5APYvY1e6gfr4xGvuQUB1Q43qBgbgbVdcJQ
	qZKyNS+I3z2wpZ3Ly3J+J2O9iG8ZKwE0ANRiX37oGFCwc2Z0jY/HNg6B7GCDS+9w
	F0MRy1IpmfLOIkJmO5uFfuQl9Fv3hMPAFAiCMXTITU849NS61MWYYrNyoJbvdQlg
	UpcVm077qMNv7AZyXD0aExVB01ubwXZPZw/YrXRrX+kI79st1VaYROmOucA3hwKI
	mcIf/KrDdwF/h1qOgJRuByR60Pe508O+AqRgmpWHlTtmVkpcJar87Gc9dLm+pzfK
	1VaMng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t880fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:26:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f015665cdfso5574076d6.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326391; x=1783931191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WE58upno3pdYgnQ1v2R512+O2faWYaoox0dr47816c=;
        b=N2srzBJJ9KhRLYQq+xEUkJU+Egx2EtrjWu+FuUTFuo7Z6oW2ejkvcZdKNAEP61b2ny
         HRN8I4M65GJ2KX/6Fx7rg8ux8fyFfC/4NUhFhedP0NId7j1Y0zzEc6lvNypkLOV+snzk
         kC/w+hvVPWKTLRxuLqudmGeja2MeHM69Zq7V6zAGb8l31MiKBZlXiFDiTCaqz8IJE+bc
         nfQNRaPHHALDqngv1mQG/lLHvH7im4eyWifQOfXxkLfJEklzYVtVuQDLUEEMiosjEjmz
         A7hjtmvT/dTBv089u000oAybL8InyqWYwwM+z2/WSXZi7INib/1TD8QMdnrdTSC0OPrt
         4lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326391; x=1783931191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WE58upno3pdYgnQ1v2R512+O2faWYaoox0dr47816c=;
        b=n8t0Cc0Obsukd6QtSQXAxPcekqaH1/sSFkXbALDh+RixPOvGQllh0/xYT1qZwBmiIo
         BEmsgChXFDKH5MIHIXHRfLpDJRJMw0Kc6y95LwDwQZYMKIQcVvVMb2zFj/n45tvmrOc2
         IVY/0+59xbI7CF32ogHJuyQKZC1MuEGTQgRMVsdNVc55SvGAOsOetAVabARzyw0RY1Iv
         1GhmOuX71roCBFuLI2oiITkVrj2sHcEjrS385fiD7XNbmKPQIJeMWrfjHpk5jkkBUfut
         0D/Dmuuh69KJ571Gro4U3O8AqxsezRLbrfKxR1rbxkbdxe6lvuLCUrc+5tvdEkUof26b
         KT2Q==
X-Forwarded-Encrypted: i=1; AHgh+Roo30YagfbzMm96u46nDqOnyr9LZjKVqkZwnWkMomsVX5f0wScyngmRrVJ8M9X3SxfFxUxenV/jD/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYf0Z5U1TbUs996loiShBhOIOrhYe1iNt9o88fZrO07B7cbBD
	84ZaPEXJYCAnyiLPmw6jcRk28Kn1mQhz31grX3+nYRMRwmdc2pcpOw03M0wjgQMAj6Cpk1sZ7RC
	5JGjY2jUoH9wVFYIPKLwfCpoyr9FWw8KpvixPFe6hEJ3P69PwEjpTVKYJOmfsx6U=
X-Gm-Gg: AfdE7clBuaGwrND6jX85ADXCPeq6n24OVjCK10VAf/6j2DVIcC4XLa5R43OXV6lq1Af
	jRaOQJj21DvityIRBGIGbEq9pgY8zVIpQIV02l16R3pbN/BrFmIPuLT9j4Wn1jxfM3EZZSGjpQA
	a+Al03SeTx+pVekVDyoqfXbu9M2hum+Rilaf98cewspSmnLWwHQBpijXTjIdl+AfPLjSLx4DTI1
	XNRIjH/lz8qhly8Sau+/wriRFI8VU0JhShzPCdrulDxc5zd60RoN0TAxF8ODAZzxz1pTdcRcuAq
	dx8lrQOl73ofGkcOPxLKvyjiiUa6JK09YJUTn1U971VYXnDclUI3zN7Zqyv95DyV5vRyIzjmSnt
	dUz0DnSTIKKa5Rc5EeAMOKs3RZprIr5JYp7s=
X-Received: by 2002:ad4:5c8d:0:b0:8ec:81e9:1382 with SMTP id 6a1803df08f44-8f74b0c2ad9mr92011676d6.3.1783326391114;
        Mon, 06 Jul 2026 01:26:31 -0700 (PDT)
X-Received: by 2002:ad4:5c8d:0:b0:8ec:81e9:1382 with SMTP id 6a1803df08f44-8f74b0c2ad9mr92011556d6.3.1783326390697;
        Mon, 06 Jul 2026 01:26:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9d1c7sm3532949a12.20.2026.07.06.01.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:26:29 -0700 (PDT)
Message-ID: <07a4998b-2199-4b22-bcaf-c5dee02c1c43@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:26:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX4ylNpiMinb2r
 L6cK3iVw8R3QC+hZR/486CmAyzGgu0+DfE1qy+4mA6TpugUNKxY6aOrR2N2Fts+2kpursCwOaKC
 DgWQ3ToMf+sOdV2zzt3/Bgb8/f2jBC0=
X-Proofpoint-GUID: DeXoNumLVHSRFjM9Hew2L-80iHde5fEW
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b66b8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-x_MtF83Af9THDvFyf0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DeXoNumLVHSRFjM9Hew2L-80iHde5fEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXzscjQ95Hh46s
 Vw65dDOQNnEF4TLkRWy9VHe1f58L/tvhG83FfMhpbClgJ4ZT0fJ8+S4OAMd808QE0cbzrMmpGAM
 cXq+Vde/hKZbUFmmbUc5AENk+cMW2hLV1xQN8m8o7pvhGWBh4ApUbJjSRwECmy56EIOGH9CmWey
 3FHmthnlu8ud68bLhmQ4aekRUOjTA2dsbPcx1+UcRQOWuKueKlMAcb5eNAyF/Ry5rfhrmgjjXDm
 bbcespF+LJAzDfIbNNGFQ45NLHLIqI8x5yST1RvqOwZcYY0JMTMtnyM46Typk9LFZaZ9k3hudIc
 jBO+X0VoEMi4bGcjlgsiSoCaJyzdJ+OlRDmC8GjuvqF0hFgATa6pQIWXgC4BpkUr1QfG3nYF2le
 2tsKV3TvdvIiZ+zlIYGOG205Bk+mqGpyGJ+gHrD0Gv/nGDBPLDBmBKeneUErn22e/tsw7vI4v2r
 iNVRKBzpB28Lwx1ujpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

On 7/5/26 7:18 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
