Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693EA303CA0
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320147; cv=none; b=eNspOz2E3KXEZfT52p5LQd8YCfupuWG+4bAHE6dz8NGJj1cbya5rP6lSZLdvhmqCSa2t2ayu+P5pG6hrs2TugMFAYiN/AzyIK8BJivevQHmPFX6e38s8wDPXDJ8umy9P49rtJT80w7sb+Nv6ma0qC3jf0rA5qZH3lhLRy9uqk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320147; c=relaxed/simple;
	bh=hbiMvwzdBeegm+xcz4ZKpJyLySBoW5ne2NZevRg2h8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgNvRqVOg67tGCfCMOKKaikEUgiG2W4iRC+PyuAkDMNi79mIQI9mZgTR0J/4eanCvTOOsB8R/RIOM+8UVtER2YYb1YAPqokHMzPF7tTDdJBzn5ioGx0VSxBJpDEvcRcdhw40SrPqqFwbyg1VxUor+tBLvFYUObJyPaA7zYIBcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ld2fHMIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ix+tR5gC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ld2fHMIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ix+tR5gC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNYmIF2296956
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=; b=Ld2fHMIfIGq0pjpb
	rSDEW8T/sQN4MXLKYJ0f2ezrDjgclALUQq4EtfTiaHpe3LmD+7KC5GYy8MhqtwWD
	wYF1IakNTMy4xk+qIH8ofUMVnjrPa+eGyYLEZljyd9bipRR81yF3AMGKa94kR8Mk
	9ab6rlqB/nnT69CUveW8R/yjOKUvlAJF8ntH8s9Q3z3HfS/Pf4lKm4rU2AGEYQxC
	BqYpXT5+JxygbKlZtEeKYHABl2YeJhsJRz5WBSplrXfHNPLGS0hdWlwxQBz/5XvR
	nOjx1QUH+u9ioCgrltCZSwOLkq6tvXKtdTlwX+XcUAu78HkBsY+KXblNvcE2Yj7T
	JiaJKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsn2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:22:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894a207e7cdso29770756d6.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320145; x=1771924945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=;
        b=ix+tR5gCpF1zEBtSROHIvp68Unw/QYlarstRNVlJ6564bxfrvkXROg0sGlGSDXJ6PV
         +xrUKf7CDsPmadyx9b4XJ61cLY53UDOs67j0CnpESyELMfJCCtWveH/W2uUfcgVFPKFw
         n6Tx5lw7aIX2vP2GIZE6b1lbF6M5xWIvV0Kt1iyyyLJWdWHjRYeF8L0Nk1veOnDkC2G5
         w0p22jPbevfiUaw/ozo29o/UOvNbaDZuldPuTmYmeS6QilcuB9SI0ONbB+AdVZoL1Mqa
         4LVRcu3H00VvgpsQu6AxeidqjbbCjxYnk1RVVqeAehoXBFTQ8rWXcldvwj8Br7y/Jx28
         b0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320145; x=1771924945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=;
        b=W0x7GqWvkFXA8sd5hDWU0MM0lxoxlP3WEGu0I2640r/hVy3tBye7K7b31o6ggtUOuI
         ZcwgBCT9WYf1AaiyYSs6YKUqCeolz5JC+xni94zgo294DVPz3Tlq8rQW35ZRZ5DMud48
         L1nNIBO6pywrFNZvGxyd/BB9F67muu747wN4yRNroq3TDAy5BQSajM/0Vu/IwiaXKvnX
         wTh4kex1WV+1MOmMz+kWfJTbybOxQIuvcYQ8/FqtA3hrfw8Tt9MPWaYSHlOMmqILaHmA
         409LI/uijnHjf1kq/VECARYlQOpnENx2NlfdC6Vb7LTsvlQEI5RRCpOq/5+q5EGXNp30
         Qpng==
X-Forwarded-Encrypted: i=1; AJvYcCUk8MqZM5s7cCCarntgvzgEdJ9h8enAV7ebP0aO2JDl1AaXP7k7R/R9v4F7YD23NrlweyaEJJlTEbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdg9IXB977sQNPqrDkxc+y9pSwloOuu1fjHHHbe1aBhqONsZp
	X4hG86mUqpZBo7c1/tlE7muY/JHFiBJlvqDQH0RhDyjuS/TikLp94FRcgOoCrrA+6Dutk3ktWWH
	Nsx7+r3MwhrBpcCbN8w+/3itBjbs2WHoMr7NEUqbfAKGsSqbnFQqjhOQcvwZGD3A=
X-Gm-Gg: AZuq6aKosTUmyFR2hlJQLl3/2FAvpcGb9P0D2ZRa+dhYdrpqHYwVslqAgv2+tEzMonf
	OJSL0SUYLsSYCssnQmi+QFTL89Ex3ueyws2mmhtxFkRtuEhySzsWX8EFc8+9mDgYgi1uR+Q1qse
	7WwenYSw6ZhhXqqXgyqe2uRbKgzcCK9GSYgeVBysdabjcxFT1F6Efb7u2QNA7r2seGJfuRo86ga
	FRn1eFiw8xEZ8Ng3boi8bdvxz0736+v/2t3XXNlyr0QZJ1QRTYOZRGNIU+rWuxa4aktrY5Ih4Tx
	mq98gKXe0wG7IPz2X6Tb51GNp51Yp65iMPNtpBqzkXyuFUj8FPNQ2FmV85ktNBAfSieF8aPhSKx
	gDr8pGwhRkbj8az/ZJ/vYxF0hoxv5vbKXrd240jE9dzVeKG306mP7QHYeQndaz1Nqrtu7HhBM/l
	y3U/4=
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr130852636d6.2.1771320144847;
        Tue, 17 Feb 2026 01:22:24 -0800 (PST)
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr130852466d6.2.1771320144379;
        Tue, 17 Feb 2026 01:22:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm347299966b.31.2026.02.17.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:23 -0800 (PST)
Message-ID: <e817531c-2061-4e82-8cb3-af7997784a25@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX556vpII74yit
 5JQAM2ntNJCGrIYhwTeaAIAabJdfkfusVDgzZyUs97Ux/b1euA7FxKGrQT7wl4YzV+Cf9r+Dr6C
 DMSSOAeKl6XaKncaD9kb/FT747BiJygDTMc8Zb2ttf/5Fu5anhBnsF1bpZj1s8EwlDbO0wMRlgN
 9idTOZVAvTZm3AZLu2tMoLzI/bcJtuii84k+rVg6TsMTDx214YZWbxkWRuWQJahS/F88cFLF1dh
 x0OwzoJBfxV8bHUNf1EAR1tLPZKffJ3mIb823V77fr5WXI31qQJKg340VTHgp4o0pxegABFUBLj
 VxuOmL1J9OuGpFAtEQ36hpekWAk9HYnG2KJlFgRUmACwjr2wqu50uMEH8u0JwlwiZ9XiC4qKx3V
 QDCxIcvNCQWhsNO+DVEbURwxtOJN5ciMfgwQMOOkYXglHL342xtwIkpIN1XHzAm9dV0k3XdZ//U
 Iq1d03YgrMlWiVTZGBA==
X-Proofpoint-ORIG-GUID: ERJfJoFj4w_3D5dPH-vZUIiwN6xxpDez
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69943351 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NzzAIdn2IQfWdxSLNSIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ERJfJoFj4w_3D5dPH-vZUIiwN6xxpDez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077

On 2/17/26 12:25 AM, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
