Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952E3E7BC4
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940257; cv=none; b=SFRG6NQ6AtZgiq50inqUfZKlHWOir6mDdFhkMn5Ix/xPlgvAiSwotXBxREkygzHArTG8L7XSlHVD3hMETgAf1ULmzVXjHo3HjHEIMTAL307xQ8wr5wIxsJUxpCGP17vnaYN4b31y6Nsgt4D/GfIr+/ywiaT1HuGY0JSHwzpbHGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940257; c=relaxed/simple;
	bh=eWKFIqGcxb5daYB5XV84TSZ/un1mg4zb8ypW6BzzXIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLu2n7qWzwK4+RhJQ72BQ1pJHDtIaqdfLIM9PT07+pa0gI2F25P7/KhIChFM5nOeP5lc5iIjpDOvGZXWQ1KVI2b0CdAJ8gMHxdESfZYhzYuIesLngOHck1v0JivGDDQIpybA2As/+sN2RifyTqQeB+ztXPMfvl3JxhtBOaMlJio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIumgAAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xghlrzbb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIumgAAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xghlrzbb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77VQ6810641
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWLcV4ug3P3dkdLY6r3CXDviUHwWQeJyI4io+fMIJj0=; b=HIumgAAPNhAc5liD
	XiOuxoeL1Fz5l6Zr8YWmPNKGe+AXhR2FI/0s2wyAALIXkIEgGf6uoUe+c9weDPaP
	2V7n2OalmhgPiOG84P7V7dqNqV9vT6GLyeFOOa57D/0jfvCC8R0IJ/noRrzIQZnz
	ebtuKZ2CRBS+89cvjdfchU11gca0N5v4B06JF9mYc955qv4Np3qNeqieopNV5GEn
	JYxuLdkYx2iwHCwKhYFEfrIRQ0kgb1lA/3iCUVdPKC1lCfU7bY4IHEfh6Pa9AwO+
	lnC4yNsguxcYNsA3pjchbPgR665otF3RWKFySM8mGyB65aPFU0rHHE3SMvlw5eEW
	aHcyaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsru27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:57:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so6695261cf.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940254; x=1784545054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWLcV4ug3P3dkdLY6r3CXDviUHwWQeJyI4io+fMIJj0=;
        b=Xghlrzbbn1IsEQ50g6UiLU6tzKvkdNmoBSDLWHtZykeaQDIlPaBpup+1hVMy8ljQp6
         OlYSiLiSMZtdGGhspPqOZ26Km4KJqWOBa1QnshLkQCFovxVathcDsd9+gWiQTjWcYplj
         qbWRY0s0DPg1o7cBJDKltwDwG1Uufv67tpDjSg5dWPEPrdcItYP7gc2Z0U4XK8fMaock
         TWXiC30dF827omWy8tQiYZLUyN9sSt3wUfCg4+C7+bDtbAgG57QWo17/sI9AbblDCTJ2
         lCH8Pfb2muJDJcByCAOCiSNrKp5c7BNGq9Wu9hldqFbENswBHCxpU0BWSmuBT1e8RUFE
         PYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940254; x=1784545054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWLcV4ug3P3dkdLY6r3CXDviUHwWQeJyI4io+fMIJj0=;
        b=fZNHpsqnlquvo9t7gJRqI2BNpc6yAqcHh4REIL1mXMnlPLbbP/c88SIiukqqonxFhW
         rLnV/tindNfqYremQXH9QZk0HK2sk+ZeBIIkiAShJpf89Cui4p3WxyKL6iNh1UlksCYS
         PHBW4gXYjDBlfzQ3Glq9/xEkfi+ZIVSHlCMKyVpvTZEeGRas0vb8BFpAHhM7i53bMfev
         QugYs+T+h1yF8T94UI+F0w2jk6hKM9s3Py/Vp/eMX2Eh0l09hj+58hK1rv0z7YheZFyQ
         uD+1HMn9zQjZP6KeLfV8tDKPKeafy2+qZ9Ma0fdvEMqPccfPPa0jIIKe5wOPi1XShbuD
         JjqA==
X-Forwarded-Encrypted: i=1; AHgh+RomeNsQLT8yf7kh9Vgjl2oHreJx3ir0eNoPpbEVqjjzuU2LmfgkBgg5X/8vTQ6ZsNTvdbBT8X8GcZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJAGzkPxEoFliXI6CVE7QLroZL4dB5LsZa32OT4xeGkzFQeSkQ
	mbCOim9MhNwf8LeqSwFYvJ1xvmutpGHaRE2PTw0uer8VtTY0jSfyI3O7CuCzJ0tuynjX4LLvno4
	6QnQvfi0SX6bD+o+bK2hJ4dD13IJ29yWsKVEq/1KqUj4JlbHyss99kTU7HiD8Jt8=
X-Gm-Gg: AfdE7cl9yHm758X93oA0SoU/Igrs7MeOR/2kB0ucrpcmI4JjNyKwU9R6Uou7qFX9TD2
	o8zwhLITRPRgwmjHuadnWVg8NEo1EWlQApNadxOGVYD9aPVKaNnh6DmNroFa1UUcwnU+d0hxoZ0
	5H3T8pmh/lBpgE/usXyIaY51smaWfsf0I4DF9ED+bU6LOCOLnUPOsb4nxkgycrBcgD+YNdqKdGn
	V4WoLqywhK6Z6RNDR2tYP2p5/AGDHaCQR7uTBsNgLN5VB+2SttfoepqrZSgxs495sVDS1EYgNr5
	Fd6EoqQKKUNbcGD0pDvsV3RIlxTUxyOmZg0cTUgHAYra5Wo9iatHD6X6Zpkdx3qRtSMjSSy/YDY
	tDrzPH9/iLor1WruIULvA0hO0CZVlT8IwjbM=
X-Received: by 2002:a05:622a:4d1:b0:517:8999:6c50 with SMTP id d75a77b69052e-51cbf32705cmr68035251cf.8.1783940254268;
        Mon, 13 Jul 2026 03:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4d1:b0:517:8999:6c50 with SMTP id d75a77b69052e-51cbf32705cmr68035131cf.8.1783940253827;
        Mon, 13 Jul 2026 03:57:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ba3a8ad52sm6872474a12.7.2026.07.13.03.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:57:32 -0700 (PDT)
Message-ID: <d6a56ee7-2380-4e2a-b217-6d7398944279@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:57:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: dispcc-sm8450: Keep pll types as is for
 SM8475
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54c49e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LUpji9rnTEX90CYeXO4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5od2O-U9YD13XNNkft5tjWU72LqGqpGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX3xCjfXWT6OZs
 CmyJ2B879g4D/WkW+nLrBl2oJu7N4ByhR3GyRCsmIIq541mtDwCr7u6WeIhpi2lzhsdJXkRJGfl
 4nW914Dbr5FtbfIe5pYEcqrJAsUbAGA=
X-Proofpoint-GUID: 5od2O-U9YD13XNNkft5tjWU72LqGqpGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfXxe2U5vM3Lnqn
 id/7BqONGZZNZRVujKOmWQKq+ovGIIhUDIGRm01jmYbtteqd/ZtGt0dQUgUPORQGri+ehLLBSPs
 iCebVJpw/gn3TpvH10a6Ep+MlwftQGVaMw7X6n/nHxqLWOnN7UnGioCnsJUt68+Jz7L5BSSRhPV
 tg1tgOT6k1O9h8CofPnqpfybEq5j+plaFMtftTbrMkAN/r46larXC8IfO4Huhbk5RBl/5f7kLVZ
 FDdslO1o1bWOyOlU3wunK6Ho2Gl62B/EtHp2NJjzP+ZXIKrQogw6XEtvCl4+/KE5nNm+xM/kHLT
 FbAsGIiSwbhO+YELqiNHVPbTT4Cebn/XfX0XuBMGkWvaRcmvtd7V2/67A06ebqRTNx5x/UtXvu4
 FFyjOLfVOPZ8Uu4PyL0SBXUBcPdbqBHtUaRk+hWyKqAD0LYLCBlb2hFGVAW5zeSQLlvsJ8oVHIi
 xH8RgS8hixp+PJpCR0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130113

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> While using an OLE PLL type is correct according to downstream code, this
> results in the display flickering at boot for SM8475 because downstream
> uses EVO type configurations for both clocks, while, for some reason,
> upstream uses EVO type configurations for SM8450 and OLE type
> configurations for SM8475.
> So far, no regressions have been observed and the display no longer
> flickers.

No, these are two separate hardware designs and you can't mix the
configuration like that just because it so happens to circumvent a bug.

Taking a peek at clk_lucid_evo_pll_configure, there's an early bailout:

if (trion_pll_is_enabled(pll, regmap)) {
	pr_debug("Lucid Evo PLL is already enabled, skipping configuration\n");
	return;
}

I think it should be fine to copy-paste it as-is for LUCID_OLE. Please
check if that resolves your issue.

Konrad
