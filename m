Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F5D14B092
	for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741600833; cv=none; b=Dft5bQD22TrQrXvuElx8uvS+hAYHE2I6n1sRH/Cien6FyfwQW7aj+yLWpoCk+gZ0b051C9LlKeC1KhzQrqm+nc32wT1MN3Cu9nSlu+GgisO7BUVxt1wKVx+Hvk9COZzP1JdnUIspG01MwqHtk91zLrAflXXtkgIdWgJhpApQP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741600833; c=relaxed/simple;
	bh=/WFGkSucmQQVqC4YRwLmx2Q0dcE6jZVaFroVNYU1Qnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ggSImsou2zcFzGjYaDUYb4rjLbVYJbAv4EHDYbeqf/XfVOcIKy+2HPrjkHAE/h5vYG21Pauv7ctFVAdJzobVUQfDyvFwdBR73Fr4aAn8xA6jMiTnH1UxWd2cTStf8QuIAFRQPI+p4RO/1RmdF/WccFcXVKpDkQTSew5cgwzZb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pgy2XlTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pgy2XlTx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9cC9b001680
	for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 10:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gEoqv9b7eMEoqWazb0zYafPZy1bYCDNTUQlmA/QxU=; b=Pgy2XlTxWpU8uLAX
	zx0dbb9Qc1lsGe2Zxn+RenQS+DywssgNwDKqey4AnlfDrU+ZF6VQbInYJ/kurxwi
	nZ+oEUbStS+u8BgvBzCTEBcT9s4wrXpvn6OCXPbfC1Z/IyFMMyDnsBgt56I6EswI
	BfvTFiqCqqwEflpVkPyrozuJDuM8pW3bqyFl7EbySwU2SiByZvjtfwtyoB6QkL7O
	bkLD2rT8JMsgmpn6Vqc7qXiDUpE1jKPVwgTVwzAvuJ6cQYRnD79cf7wyzJbvewbP
	OLzt3PzZwwSjgzDbnzdMS0hG21/9kv22gxMLgby2iTU3Eg+C+o8MBBrV97Y6WOH6
	w7dCqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk4dc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 10:00:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso7195113a91.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 03:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600830; x=1742205630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/gEoqv9b7eMEoqWazb0zYafPZy1bYCDNTUQlmA/QxU=;
        b=gvGsFnqVGDqNseQ72Q7cuH3UttlpBn3prTNnxndEObitFde0Up1J2VjpZS6oMSbo7k
         x6XTq85fyiwe2g2HFeFNIVaQjDt0SKcHT95Hb5/4JwUY4rBvm8dze+RcInE5rJ7vQzwc
         dmEzJF2aztNYXnNxvF4490oNTpTcVJ+tsh1Hz9jZyvnOe8aG+3gL3y/hBiWS24shpF5M
         z49SVO33Z4hNNXxy6uE8CDy5P136EL5HMwe5Vlr6t9JzPcLfmnzeSDla573gUJZ7Oe7Z
         Whc7vy7GTYyHmXjimVJ8fBR8CToAkpeupVWr8DGYEfT/wCwtxbL7k0UbOZUSlOyD4pim
         FXcg==
X-Forwarded-Encrypted: i=1; AJvYcCW1nYAG0vgHGtj8Y4PGvALQBzNUU392d+JAlwoJsaacuC5hrqHVhdactGlv/HJzDuNRm1yJStKLQXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwItc6f/7MpUXp7+dER3NrRVdNkwc5uj+2M83IsRlFDw/wVCcNl
	pfSoWPajcdFu92+J2VLL1HgfSyLdDq2qV+C8efJMiUmzRBJOx5bez8pseEJNoS0SXxWA2YY8w0O
	Ug38Q5Vs4dorb3TBGjxhzsvKkzVpCsG+v/sLEO4k8s+0J5RuybPyJS0bo1vM=
X-Gm-Gg: ASbGncsh7zRFjRTKtUzWzQJqdmIQVdnpERwKGHT+SHulg4/u6+HPEMhz1k/F7DPH6H7
	2fXb0OJ3vcqKrLb09FrUFVhZUKUpzqO/q7KPgid+A1mtEZMD4sspZIiIqoTzl+CFi3HHmn1iKwW
	IKkBWVBXKJR3BftJIVVlvnSpCi5MbrPhNRMatTVambZFP9CYLXFZIQB0wggPT9UjaKut33Yvy36
	qrt7I0VgVsMtvbeS6wIZmgVKcDX7lpfJCTQdI8XTr6C0ReE+kKkMRd+2wY3cdOg8l65HkrpleMO
	tBvKlKqOpcAOsoWpl1OwmOcfrE2U60OpQV6lIbNTD/vI30KfrigljE4P
X-Received: by 2002:a17:90b:54cf:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-2ff7cf09609mr17131115a91.22.1741600829610;
        Mon, 10 Mar 2025 03:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2PnlBORgrtsnN495wyn9nxcbur0ZbfXPq3v1ScLmErAorXFDXK/mJYeYf0Bj2DhaFWSa+2g==
X-Received: by 2002:a17:90b:54cf:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-2ff7cf09609mr17131087a91.22.1741600829242;
        Mon, 10 Mar 2025 03:00:29 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f9f9sm73645885ad.125.2025.03.10.03.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:00:28 -0700 (PDT)
Message-ID: <bf79cf5a-0c50-49e0-b930-1ec5028e7d0c@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 15:30:24 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: clk: qcom: ipq5424: fix the freq table of
 sdcc1_apps clock
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, dmitry.baryshkov@linaro.org,
        quic_srichara@quicinc.com, quic_varada@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67ceb83e cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=o3auzIaOksCvpTgIIaIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MpfIpinjjDH9E_sqjObVZ36L5kOTPCPj
X-Proofpoint-ORIG-GUID: MpfIpinjjDH9E_sqjObVZ36L5kOTPCPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=795 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100079

On 3/6/2025 4:59 PM, Manikanta Mylavarapu wrote:
> The divider values in the sdcc1_apps frequency table were incorrectly
> updated, assuming the frequency of gpll2_out_main to be 1152MHz.
> However, the frequency of the gpll2_out_main clock is actually 576MHz
> (gpll2/2).
>
> Due to these incorrect divider values, the sdcc1_apps clock is running
> at half of the expected frequency.
>
> Fixing the frequency table of sdcc1_apps allows the sdcc1_apps clock to
> run according to the frequency plan.
>
> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

