Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9C386554
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154015; cv=none; b=uQSxLolfe766xNs8/wWdA0cVu+e9Vyl0V3KtG8Ad+QmZg2sjn0ScsoQRR+4WWHogLMnfbk2UAABBNypOw05EkciHSuUlOrWfZcAn/lM6EFMOtrQWK6wDo+LZPxa/rNnCiRZeaxHVG5YvmfIDqEcjdy0y5fDlsVmxPE+iTXKt9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154015; c=relaxed/simple;
	bh=JXSAZRFUj4/4KS6bbrhUvanR3/5N5X5ewMFF7ODmEr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u60m3tYPgqyVfXQow368Pp4Zq3NPXkQWi2k6fKj3xB4E69u9p70PBgKs6DRLlMdVJSRuiSIUsJ8wI68nwSmorEFf8d0kdsdjFAaTCOQFWzGVuEKR24cvsjW6SYjkV8ulwZ6IAtbZgzqcNJmmjuqszRnOhUEgIM5x+pt+9ey4WJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQd74dol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx+IGZsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQd74dol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx+IGZsf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6epqD3681355
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=; b=HQd74dolg/TU3GwE
	isdVVR9yiqcPmWNqHKP/hCah9xLpneLiqx3UEZ5pORLZtcTiOpzFJFEGLdv4HdKq
	cyNQ8fPpXMabcJo/nc2VD2foKd7j6H6g5UUVOi5TKbCPnu4Z4jGDJhbp8dfnxyO6
	bsQLN+X5TctNLYKmbj6CFVioBVXF6vT7ulHRV9CebOZhQXwWKiMXDSdRN2vX0pSE
	n4Sbr8LmiRoExThb8yPc0Dp+V1GkBsQzDYdmpVaMhSgMhzHCHvKNldHorTbD4yCw
	n9UtYnx0Ns0M88E5CsGFAg55lye0GQufD3kRG2oDRFONarqTDi7NJyUgQC8CuqDf
	lPnf7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d1ph0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so10185481cf.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154012; x=1776758812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=;
        b=fx+IGZsfZjRHCgyFxuNzqgVqSAlruYgNIsZmUh5D5hlp5aHJSClWTKqDJfSpugl1N8
         6bC9yZ5ybwGZBVH56fH1ehCzD7s4BQz2sKB676N7LIr65hYt/PKdJCk0AfNZJ6DmM/rc
         GDiKvOARmdNM0S0lyBdYko8/U13nIi33ECMGzDtidsMIgwCADKyKbOZ52rf8l243UAvb
         68z89Td5zZw4FSmvWwCWlJsBhP3NKPwNmrnEDBMW7YyGN+7NgWFoJn8hbs4o7PjkCZx7
         yrHbDsctkI81KSMrZU8H1i8xMYN8il8fT94p7NfPTPjYbFpF+Tc/3nwDT3L0Gytgv0Ll
         W4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154012; x=1776758812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=;
        b=U1o+EVTpk4yr3hZeW4vaHCl9jVNsJxAJzG6Bc9ubeISZvUyEhQlIvStvjdxm9/LrZ2
         PS8v3qq0Rd7o7PduWjysP3wB0wgxASMM5kmGW50xplk8HKX/6GnD6Gqhc66dJp5dvWFt
         +cUbIHSQ3yZ0cPImWGmck4XD2k3U3FmZBztfm5HAppO5kXLIufw+oH27qQ0X1gt1sOnP
         OtPK128433HDiPb+Mfxzp/czS4A7z9Uj4mONLmWZ2eeza0YWU9uFZw8OA9R+Tzj/aiNO
         y4wkLt5drh7p/IMInfeZ8nBleEgv0HNkdY/RHbHfjOQJf/y6Z7oXZsrdZ0Sy+Oiqg9SH
         4Plw==
X-Forwarded-Encrypted: i=1; AFNElJ8gHNKKVxHFUEoEeCUm7E+4Rx15aRDBvyXLjfPOyAIlBG9Tv/fPu5Z9+BGqIyjOqC/If2SYNNqo/4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3SsALg1YKWO8OMqm6JtaiU4zO4oiWWQ9HUtyxXiIKNbnZdh6
	OS3Gg9Eemn/Ub41YgtyqYAoQKcISnNcvzv6CwafGG76oSUU9cRlQUu8gL0pdZuatwcT+pzSjLv2
	c/SosTmMT7Vhu110+W46H0HXwabQv0lhWYccPB1ffYVTGiyGURBr0RrGAdUxA8ks=
X-Gm-Gg: AeBDietYFnGHKqt7rvpr6PXGSMkSjVFBXHMlfh20C+GkCO4UUP3Sow2GQ6eWuis/2WA
	BAGkiEEdggMJAhxfaCs4fBgopN5h6geO+6WOSUtGF4frXB0qwcjoJJZFsCQBezpPtEz6EShJBS8
	qtNs2/M0S7iqNDA/C6JLp+EEj3FLlK2Wu6mv9NVTmZ6upGTNHTer2s122WoH3UJWcmnF99Zd7UX
	dGoUogE1/tqd4fHr8R9fnSmPj9M0nUpg6X80WOTm9WLUBIfnIiXVRt51cjzpgX68GTM8wtWy/Qs
	qQ15tTxxbao6d87On2LcDK/GRWdV3nPVrPbgyl5VIPP/BHYW/XAmER13fA7Z5wgMHGcdn9WEuiq
	WWZXZ1NqUYo96TYmyAV0RYeu0NJVCJSl/xByJqKR241frYmnHsiy0LAWnJMGyjLfkJ/C9BcMSC6
	FK2gEFGioqz6cAvw==
X-Received: by 2002:a05:622a:22a8:b0:509:219f:8e34 with SMTP id d75a77b69052e-50dd574d883mr159458201cf.0.1776154012422;
        Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
X-Received: by 2002:a05:622a:22a8:b0:509:219f:8e34 with SMTP id d75a77b69052e-50dd574d883mr159457891cf.0.1776154012013;
        Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671d70c9656sm330688a12.31.2026.04.14.01.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:06:50 -0700 (PDT)
Message-ID: <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX8/w4u9Qtq2pD
 0rJGhWoD3ksC4re0VRq38s3oQ8ybbMZCHVNoshU87KvaLchkKdxMyvgf9s4ptonkhAmVSQ3X8qM
 5aitffZELn+i0dJkkYguXaD34Wyddh8RKjGsj22uiN4iSBZtVrHXM1yAAZPZbKaEYQeQ6Nod/0a
 MLsoWuQcbX7AU/p3RDcSTzzwsRgIzoSXyLzTWnfr7F5rX/lEOJqALtwwvpc6kFamuII2uFSEgX4
 7e544J5RmV56qDLI8+03tijJVbudnwd+xJ45XMI6U7oqTFAtMlw9wo8+3aiM97X2vfQ5fqmFOC0
 XQVrIAcs1FzI+7s7kRdqHyJRxTt3kTv7QJbUQPH+d4gZlmBsGHHleqprEcJCNppUWrGt+OC4sAg
 t/WtRL7gTNjx3y+Svfs9Do7xSSOoR540XvhSdUt/2Vndl9dYhEB47VTWx4C41h4Ivxs3sWw5ZS2
 eGBH8KrocVijOhj1+nQ==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69ddf59d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=wxLWbCv9AAAA:8 a=d3x1nyaPrRoEkPAh3MsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: ghxrNAx-udDIUGUbwmkq1_cSUgTAOAHv
X-Proofpoint-ORIG-GUID: ghxrNAx-udDIUGUbwmkq1_cSUgTAOAHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> msm8960 uses the same clock descriptor as apq8064 but lacked the

This doesn't quite seem to be the case, some fields differ and
apq8064 additionally has:

QCOM_RPM_PM8821_SMPS1
QCOM_RPM_PM8821_SMPS2
QCOM_RPM_PM8821_LDO1
QCOM_RPM_VDDMIN_GPIO

Konrad
