Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D12500BA
	for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211355; cv=none; b=J4pwItM9PYKxz9I1wcbJHMpbRB1DIN6ba6VLXaAe13Iy1QP9Z/M8rF6Qf/AJZ0U882gP/la2t9yDaTpI4dhb5G095fQrNoSrdffZGzo/YeWOB6o+NOh8pKkzM7wc9hteCWfcfecDlmGytBgi3Pkj+Fs96N6YI8cPD+5sqtEQcFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211355; c=relaxed/simple;
	bh=DEygm5HWW7X1xdGiLNElosyRq33AJuWmRSE4tqMOcIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s944jwJ4RnU6G2CTthxUkXotooyzHUWICo2LnSiBbAg7VnFWICPTZW0APW0uJnHVYdAZQqvMtLOXn5DqgPoi8oejTaLwS5ZsHQZEyXpkCdSzwtnRXQPqo2oOQXngzDK9vQfk7IQ8UpawcmtfP7KOt4IIp1xun2z+wbwMX7HT7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k98TtJxG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k98TtJxG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHUrwr006164
	for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 18:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=; b=k98TtJxG9YSJjlkz
	AZn4RsntfJ37bbMCwWkkY6LGBUw+WXm0i23q95qFfFBG9wSOxFzQ7aQaN1vLHXTc
	t16eCKLZcEd9Ng3RlWoINgr4B+0iu3EmsBXovO5HGRPRM76udX/swr8InhRYzYM3
	qYnKXvuvldCKB8tuL6lCSgs8yqklbLHdBFPdtyKW5TZ/JrfZ6Cvx6b/hZLoZWaqj
	ICqGUL4Edn/+pVeq0nvdeyfFlAsFa/bqwea3trGlIlbuFTFh7zu29JDM3BpyONdB
	XWT0mlS5euFx8RvxLJY01O72MUSsjzb8cnXLoduwp9bOvuTzJ/SmaPj1SOjKnXuj
	EXff7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5msjrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 18:15:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c05b5e86b2so6469285a.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211351; x=1739816151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=;
        b=OJMF12bkQYhhLe2gbMO7GL3RTltvaj0lnNV11sPbku5nSeaiRyfUrN34vVphPPUkVi
         XWlYVnpIxWbHcyY6kNbUN5wPYvNqkFzN9Hqcu422JCt4DYAPx/UepgGaUldT8EpcED3W
         YAVNRhOGfkFLfZumWqsyNQzeeU+3cPASYlxkM7L6fTSdd3bm2pNirig+pfD+g5n+nQ7/
         kVEt5PPTVWUF42WHfjkTDzRygcvS16JlXlxhSbFBnI5m5o/ow5PC+eoZ3B9/1ziqzcFb
         MwAGFRRmxc3BteZH3zIfSI4DivRN9BYrTIr6s1tfWQkBLBBiOr8X5fCcFXrZW7pmnu+K
         7cWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwyYaK15kXu3DRKgVZzNa0Aru6VRWd0rhMphe0biw3lN5HTKeYVBdYH+JhGaRALVdRRNf0wUWKdBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXbqAjDknj1O4989J0T3smhs9JrYuGwuINxVjWDglbcJjg9sT
	x6JysdaMhGa30a10JIrPhh4v8e1wYPd6BdU7SgbcMaqf81Qj7q+oeKoWN1e3xEHhu4vp4SjSsFa
	rq7TqYqtFbWJcaJaliZCsO4YTrPd1+shQHS4YwBTix93OgI9/bate5OcHPAE=
X-Gm-Gg: ASbGncsVszPdZTtyaWk6hleePi4Rd10qY78GIOVQ6CAK/ockhGCcS+RcorWGTfYtO7L
	tCdmpBfO/Z+nDPNb/5E3Ev1GlM+PRWWKT/4txjUBnpEHJJPkbcceZUFTEI5GQH4P2szwaRmcgdo
	PhtwaVBCh5ifnhWGtjJxLommE1Z1bMQdyRghi7uJHP+YXT8ljyIYYx6WEQ0BXf/Z89TJYnzAWih
	Da4y2M4uK5jIV2dVvcF6taaEIVHuQro9Vl2/htHg7vqHhr/4+2+all3fx5J9ZUfH1pvUIJe2h6G
	bVGBEPwW4Y7vCaKMGCCFtIWQbcX3VKKQbuIQ1/KLOhR+pT9G9VFGNhTCBfg=
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71995091cf.4.1739211351339;
        Mon, 10 Feb 2025 10:15:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+wRXNnWRPbq293evDdIvEhGqEHzq1kYbvdr3w/KyUUAyfZrYq8rC1dDpVfln5xyQdRsb5ew==
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71994941cf.4.1739211350986;
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c77esm8235727a12.69.2025.02.10.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Message-ID: <0a1735a3-b57e-4a98-a3c8-46e92b5cdf0f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, ebiggers@google.com,
        ardb@kernel.org, ross.burton@arm.com, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OJGnpXyw2dv5Q4u-mV7VBqXZGQrMg3L9
X-Proofpoint-ORIG-GUID: OJGnpXyw2dv5Q4u-mV7VBqXZGQrMg3L9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=709 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100149

On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Thanks for getting this buttoned up all the way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
