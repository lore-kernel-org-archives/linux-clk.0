Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7133E2AC5
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795531; cv=none; b=Ed5WuePO+qffKwFNG8aqeI9N3q2RdO9yN76Tlfujid82a1qQggOCMPd61ks16+FpmiRtVn5XASiexMUjzT22cH+eFWhQS6wU3VKFu6E0AAbxFHkCu9G+zGdsjE9mbFRh4IVnQCXTcsSK/lo+8fWTKdy1Ac4BWi+8YPD/gMveWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795531; c=relaxed/simple;
	bh=Y4EyEFYSbb/f+hsFEfhvNwUGVQsnvSEVf8ZkcHQkZEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SD+XP4MzOabhak6lgDePdrcFiUfjDRHjxjC9PytL9vrFCmJ/lXiJpUTqJuGUuLJ00dgUyq3khB8pdr7A56LyHiySU3YZTMStKNBlKaXNMC7i3qfhLBOcdE+AhzA2KgRvli2mlbW8InBe301DFXr7zeh0Xqycm1patEZwDCF1+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOIOhAeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfF5zEk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOIOhAeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfF5zEk+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6mSqe3263539
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=; b=nOIOhAehciDL0r8X
	yax84JZEqX9g+t2judWawswD2Uerl1ZRRmEoIDY3F49rDrIMpX+nQIJV036GH+UK
	n9GPI+W0ZH9zTRySlJ8ihStHDQKr7wNUGGYtEG5QAo5zEe5BNxFrVstAjhMFQqhR
	GGm9pMteCbYenttuAHge1wF1wJjOdE8MHm28ur5+tWpZ2oJqnv3w3VgCaFp1MvWk
	m2knHSnGOsgJ3pN2y9eYgspWZftFMBlhzq2a+b0cZwuz1szHo+v6DGCCi7QujOX0
	7ophqcMsUtW9GbcDsH29o0b8uBE+VcR+SavBsOc4M1ZdcZGUtsMxfpOIdCSyYvyM
	zjqHUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs48hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:38:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso6718403b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795519; x=1780400319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=SfF5zEk+Ij3OiSDNbYiE72+rsgNZCMhb+8dgr0sDzexKqhxcqmrv4uvyIs8zBxBkec
         cWIvu533YXXpYUyYVcn68txSqMJxOUMC7LTLwSzXlUCLQGCoZ1WF/WU36cUnkO1B9CtT
         lG3lnxvQQTD8EyiZrreYiiLRsMdqILuGkmWOw193y7+FHFrjV6BlREIyl7j6gFut6IW+
         6Gl0yN31toRW1iJ0g0Gb7nLDgrt6DbZvReoXCR7PJMoirHJCDt+R7SyagIa2VI5zTPb0
         xhIC7BAaqo0bMlZSZYWLfiCRihPiRq4sQ0AFnBqKsK9EmVmQOrebH1blpvl/LdrUVZtC
         QPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795519; x=1780400319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=kp2l+9j1zGwUGD4Wart0VyVkUb7qcwhUpzTV/uLqJmxpyKlY1AVeC2KOuSWJw15MMq
         kSyn+PL2UucWYy2pn7Ai/BszJtbNYYChvm93WeiVQpa5PMliggtmg0nb3HNy3n6v2KgB
         bRaP8tc/j2GAX7pSnkSUeIKSaiWxZ0V+7RqCqjt6TgUiXzCgv4HozoKtyuRgqqnoZfor
         m40aOIYHJEEsBadS6IpkId55pD/NeA3YeN7lCl4qcVsZPBvMIrOQNX2cHiYmsI2BS4YQ
         kCK/gBgfNX2ML/Nk9CXMOP+ClKPbBofxDHy+PT4zyJBLORMsyAjnODt6zB/5alR+DwIL
         G59Q==
X-Forwarded-Encrypted: i=1; AFNElJ84CGHJs9yHJtwMUTinz+EDIcWB+BeUscRO105saXs5kWC5YQxAdUTmY03r2CxssAt1wTlmJbG4b48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhyb/v4yM13mh8VCcAUEeMUA+fLgM9nR5aaRO7WWitheMBGRWj
	diz2wzCOs3Twy+vhfRbP1cX/GnStFlpRQrX9Cr0vyYjzjK7oat1tM04RjVN+8eh/TcM9DY2ckax
	fvm1Wz0ZbmPW3D6338wl5El1cFRMDld5TzUZPYCRLuNH1C6nHmlubJUwR3uZkV7Y=
X-Gm-Gg: Acq92OHbb5vASVPYqwqs8DkfokwEUnMT93d3wFhSThYChlgLiLs5Yob82/iy2WVjY62
	dX9tiu0juO27eSOqE/BDJutYkiTFlrlr3F2aI4K4OHOy80W2WDjBrDIubF74CNzIoVlIaReLs4N
	8V4/PUz9RAjxGPG5Tnny+4XR9GLeCbBny61kTn37cePEW4MakOtMkDe1TtWOKQgLPFSslhOT/0Q
	aEMV7tGhqwC6HqDtmRBMQChTyLGRCQLIOIdqqvi2NsxXGKNximIqroYhmHnsu7jHL3gqR0howMD
	3zXEOS0n0xjhjreAyDiAF1z+efVooB91FP75N6Q4KR+jFnyJmHnpF2+wNHk5K7yXtGjdCvFJusO
	+41v+9Nqi5bAuJKD+7liWTPv+d7vNULQEJ3iHw2o+mr+HcPLu
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382861b3a.4.1779795519483;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382828b3a.4.1779795519008;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:38 -0700 (PDT)
Message-ID: <2140a893-8959-49d5-83e2-464ec79e0801@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
 <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a158640 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=StVILoaL_uWnGg5ebB4A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Pqj9HlK2mYuP7KwiiZEsRa0WAdN_NlRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX1W+j90vUqelw
 Hj+7NFkRbq76bmKFxd0NRAVcyRluaTnX2A0lMbAyzIWTjb6VrCpgzM/2pJ5o+KkskiFLbxvHjW7
 Y43mt1ANLXnpCs/dQBALL66nht0wEj2DTC0FqkjX0hGE8pGUYpCBQ7Z6+I38ZckMwybM+RdZUXp
 +GCSk5nFVCwD8VUw9ldXsNCGXtbSfrK26nqWn95uYXwgAO5JmktQhLGm4gCZ6deKLmu0XXhPgd+
 AXoNpLBj8hq/kFvYfYdnO176+D3UUQZYVGLt0FzeaQmGRwmXUvGOb67NZJv53F8vDeteWigbKIC
 Fk/wFrAEnCAy1Av0I8R0OVGRnPssR5CBgBl7dDtnsL4t/q4sM0TPDxTYoRb7oaPjtAFuBBCH0ou
 2k2+E98WT415bKAQLfMblKHShIHRcGoHib0Xn+rYueA81ULYDpGEYU/PTM/aQWXvDHoQbnm4aus
 Lc+MSLHADn5lHt6zCvw==
X-Proofpoint-ORIG-GUID: Pqj9HlK2mYuP7KwiiZEsRa0WAdN_NlRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101



On 5/25/2026 4:42 PM, Dmitry Baryshkov wrote:
> The camcc and cambistmclkccc drivers looks pretty close to SM8750,
> except for using a different PLLs. Would it make sense to have common
> drivers instead?

Dmitry, on Eliza, CAMCC and CAMBISTMCLKCC are powered by the CX and MX
rails, whereas on SM8750 they use the MMCX and MXC rails. The PLL
types/configurations differ across the two platforms and the frequencies
across rcgs are also updated.

Due to these differences in power domains, PLLs and frequency plans
update reusing the SM8750 drivers for Eliza was not considered.

-- 
Thanks,
Taniya Das

