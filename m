Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F73BA23A
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953294; cv=none; b=ungV2Zo5LnIaZ3YZ0djiHhjO2QLBjsUJiN/Yb2Z8YNMIrslP1caoMeMpXSQd+krXSjienbToDyMKKwOZwlaq6s4HVCcOdVz6vqYwTcFJb69QXy16O4QrN7KP2RXkiLnA6Qkj82ggE2G8s4OjeBAsdGxm8IdlCLoKzGdeFYQEH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953294; c=relaxed/simple;
	bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BX64ELXKGP1ApXZz4sc+lfLI4Rx47l15ahmpnNQJBczY0ZpaaznoX7PJ+b+2qF2s8xjNpi3DCL+zg//dfY58qlgE6mWIH97cvcHK7EKMsBpYkszGu9Xfcw+SW4wkrzcxwgQBqis0Liqst8VaMG9QDwDnEkN78pfgjN5PslDk4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD4S54eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXRanUXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD4S54eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXRanUXp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H769ua2123190
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 07:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=; b=TD4S54eFkBGd2wid
	FOhbw/dyQ+WhYtOZ8/hFDbJ0uOEwnH7m5o3hFLKrJAr5us5TcOEqvUahrck0gNU0
	DAb3G5dE8tJirtVLN+xM0RtJ0RyzsCRW2A0QWDvlQbr5Ah3hThiyy1lwKn/SvIdg
	ghXBqZrrvMx2vrugZ/nXK7We4spb8Zm597p1Yf3Wo3HybER4OaDmi48OGywvpWh8
	xz5kWjVAF2VyMsrRsqfwwC4Moz804224cbofNaBE6Oa/xko75xtr8ktAQhz/QewF
	j2JMf9LVuaanOkKRwUrUfPj8F8m2TwlAbWewEyIdcffr5h6HleRAa4wtvee9LJIJ
	iJx3pQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7r5hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 07:54:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84fa3b14ed2so2735019b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953290; x=1787558090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=NXRanUXphNNKoD44uBnP/0OZHGY3XObOQSfY6tJh4RBvub9HVVJ/bSWtpmytRa8AtS
         WSKf4X0Qlh1qu35wehKntdv8hagr7yotRhnq2B1m2tdTrEIoBLlwGPpNZIDSQVMNpVHh
         gHpC4o43o6/xoFAcaqb1Xa7ZF19uJnPrcWC5Bhtn5pMvYrkldzHj1hmRIl8xIHdg1KGm
         KHGEPjfxvb46dJ9RCESEeAlanE2mVlWto6DgppmcGyfa0m11rLURHmkqjUoFpYsJMVrN
         q8H4L3lmHbQMK53gemzDWkehOlj2pWZP0hqEdnf2+2vvH22k9X2Pp+oErYPdMe+vVG3T
         0eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953290; x=1787558090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=KShm3g5HRP+DAYc7X4PVfN9oF7Oc6MA46LgoXWaaFxtyZC5dh+GHRWAKdwIfrOzshN
         Ia6Jedk2sZPXHCNFcdgv0CInId5Job8YFbajn3GLHJNYkPkSP/VELRTMjD81Nptq8Tat
         yjH1UgJUBOpr69dmo/kFjse00u5TmCngRcxJgqhgdjIsK+Y87zp92PV/8KZ3DbxkOsNx
         KytrDpXCy4ES5dSAwWU+qwCeDFF2/Ap0SOvTHpfqvi1fyp98gn3NiL1UJLONgT9H9aFi
         MTLssoMWVwS9S/V1VJ7IATFo+t6m1/47xH8mkcmrjlIkRUqxtI9Gip3S+IT4tBdkVCO9
         smqA==
X-Forwarded-Encrypted: i=1; AHgh+RoSx6Mqo4PJ8F/SMM+QONs42EL5qCzvUIL5Y38JqiFW9I/Hv4Q+RJb6uKSyjkmzkFQ8Mtc5383ceYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmDCCmpSslQUQW8OQMOrVnQR/dPMfQTK5DEyDFvKRcg2zknrH
	+6E9ZgS61g/aAMHZFQMr97rrho4F4k/RYmm6k3f2ydoO9ULSY26mNSoXdctAxdjor0iYrJ4aM9o
	gFUw8IIoANMghUvZUlBqqOalbHNrMsC6ddfG1Qsa1Bc5hfWTbt4Glk+6FvzN2g58=
X-Gm-Gg: AR+sD12O4IQYWCGtq2acz1QD6ivKczoVRmWU8nAdf7JVfgYXxagT7s9ntkIUD+vOdwe
	0att43VcRwbfdarmXJIP8m0YxwAh3YKocQhWoyT+Ve1DxNtefsoFEF0HGikidAV/cu3I+jh3Oha
	Axc/z75wRd8wnPYsY3zmM/ICFTDzX1PgI3l2dLZucn+uK2GWClKi0XH48x4xgp2ttt39YqN8FYr
	7Rg6GREskclNUUUrHxvNym8DPYB7r3oh2M6KTLddIJFv5BfkmouZbI/aCs49MLJO84NcUZbgh0Q
	LarfTnAXpOjXf/v2gFD4SnAo55gygVmZC2ajYn/DihgAwxou7K/DLDwOzC0e8VOcvYcEKje7saE
	78ECfucjgRMzYzaVCEC7BIrdMKbloW8AxMttqICrEx3WArjHLpnzQ3d2ooHCzv5dJ0Lww0qcf+v
	POr1z5L9kF9hH1q6oeZF4=
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22977019b3a.33.1786953289831;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22976947b3a.33.1786953289376;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401e10bsm186190b3a.12.2026.08.17.00.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:54:48 -0700 (PDT)
Message-ID: <05c743a3-0111-4b80-be98-b65b3a09ce34@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:24:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
 <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pxzhb54JbGwgOIkoNoLinuhpUh5fZXL9
X-Proofpoint-ORIG-GUID: Pxzhb54JbGwgOIkoNoLinuhpUh5fZXL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX41u1q1KfP7UH
 t/Oz4ZjQveDB4ggHp0OVJgLHtczMpjbhUWxKCIFQM2Mv+UVV+ehK0m0bU/fCK/skyK6/GFcziHs
 DYraSV4z7lfr818svf5lZRkRRPQiKFgxktm0RiTztlFz5hvnKoAoYdjKY669RmIEROFBCfGdhCS
 o/vCG65GSMlpGgg7FbswDASWucCzTuXR6QCpl5j0nGMF+cNk4Q6m6Zus+unBsPb2sIZRt9grL9w
 hQ+cmOJq+CnzaiTaGDpaA2i4FEfSL5jFA2gitzok+DvmOyAuj0naLw68Pjf3NOIX3DP+6uA8uMH
 wcNUzf/rfSvom/icSdPqI0MfflNLXtcW9Y02yaAYoNYL98b6mEYTmWVaC2c1+8gOfbLDNBz7jc7
 k1Rkg/X8r7+EIxSWsEyfp5qVLavfCxa5f1vRkGJw0cOYGALnmHzmiOBQ/wIb1HyLbg75ux7+AoA
 q9saOFHtJ4Sb1XzhBTw==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82be4a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XtOoD4hAqv4hDt3uobMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX+qqKnjadGqTu
 edEZHQyuGQQ8NzGOxhqXDco2YdACmseJWfImHw7QoUXYLLQCOawWt4a/Nq0P+DAJ3yFsZpgLuwi
 /jlONRF/8jU0bXgPI35Dtbfmw+dvMK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057


On 8/17/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:41PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> I do not see how you addressed my comments. I should not be needing to
> verify if each one is implemented and then say again the same.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

   Apologies — my v1 reply just said "done in v2" without detailing each
   point. Both your comments are addressed in v2 patch 10:

   1) Commit-message / binding style consistency:
      Reworded to the same form used across the series:
      "Document the Global Clock Controller (GCC) binding and associated
       clock/reset IDs for the Qualcomm Kuno SoC."

   2) "Not a power domain provider?":
      Correct — Kuno GCC has no GDSCs and takes no corner votes. I removed
      the power-domains block from the schema entirely, and dropped the
      matching power-domains = <&rpmhpd RPMHPD_CX> and
      #include <dt-bindings/power/qcom,rpmhpd.h> from the example.
      (binding 56 -> 50 lines)

Best Wishes,
Hardeep Sharma

