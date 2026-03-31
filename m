Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8720B810
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948812; cv=none; b=XETyxWY2iRXZ6TFAinhSUvb9ak0kI6QEaTnKxi44xhSkIq+O2ltXCDc2B9KF1uiineSzO7OJq2LLdTkCH62SclunB6MT9FVIKFwDORmOfBoGJO6vZSsJcIWNsryZt6S+5gxZzeX1otw4houUV5VWRkoCbQ65MMokbmrcFXkWXSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948812; c=relaxed/simple;
	bh=Yl9t6/Pl+3fK6Utt6eipDPNK7U0WU7L65KCnQoMDdZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=my3C1wjd3m9mYpwA9Lv3zjuVhr8TnVjWb3iR2Tfx13OBBBkqQ09qdWgfO/h2Gf26cxpG1nftHUJY0XUxlqQelflurS1NscSQOu2UlagVylAn8PHE4LdVhJj/gJxsvU9P1xC3ejktlNxA0nHSUeH/oR3o/oj3B+kx6RNVyIC4kkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzCECOzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As7wIdhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzCECOzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="As7wIdhd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6a2DR2391342
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	at4Di3FGHE4l76i9qpCcTEum1hZPNnHxC78wx8v8c0M=; b=QzCECOzVt4bTbuf5
	qlgtWMNsWM5k+HxEeRF0zKOAejbL0DHvCEXqxfs1jaJai/2sv9KRQ6hnhYhh4gTM
	C0omDJPFBljTEGOi7FfGjDM3Yf13IEF+q0agZGblpx3yYCpUiSWCKMPXa5BkYSo1
	1Nqbcv9MeZK7Ix0sr8MA27Ldx7Ryzr5bRoGIZlSVwgbYahQ+QYwan9Uqj9a6j0R6
	JCquZlJ0k0p2Q1Ptsr3fE3gXJAUFUD2BqPfC8XlfMidHbVt3CdruZGTROPWTyMv5
	y9DPDUf30ehDFhjlHLcBUC2rS8/CDhiFUDnc8vUlY6I3feNy6gHC2Ler7qNQgSPB
	OW7BOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kt1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:20:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso34292165ad.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948811; x=1775553611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=at4Di3FGHE4l76i9qpCcTEum1hZPNnHxC78wx8v8c0M=;
        b=As7wIdhdTJMi2txwLZzgRl5JeSg6IPJIxqBEEILtj2cgEhVQd8bJhffCcEoctpqE/M
         QEHJwx7trxGlcgIO40epvshbQ6u6rID5msPpJKo11IYLlu43meXIVhBY4xgo3m4scmbK
         fbBoYkZ1dWYRc3hM5NjMqrdBGV7suY3RH6e1EKBgBfiT9wryuwKI9M6OOpcs3bGVYfOm
         B6FPv9QAykIajiQ4CMueiN8iyApq/QjkAE4Q/mLfLyTakRzLB0pqGROFppEwPwL/UqNS
         70t+FkScasSTmJpBOwDmpcGH5kP/bwDqUUDoq9s3qPyMzGmyB1a2mzQL+TuyJQCeyrMG
         3aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948811; x=1775553611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at4Di3FGHE4l76i9qpCcTEum1hZPNnHxC78wx8v8c0M=;
        b=MQDMVuV81U1Aav0mEVIqu3vfLihuEZYuW5Yi4jbmq6Tz6L2yPCxpYlwduIwny6eU1c
         I4qGPvTKyVHa1aIdJJYIQv0smkDi4ai4hv/gPjKR/oozkKIndmg+VzStSKyu85xyJNmB
         2zEDLd9aJTYBK2nUA+wnebofqH/R3XfcqFHIGskP5od5TkywfFt4mxF7xEyDGB7wZySs
         J2IMrxg5NjqpWhdl39BF65MTiw5PrgjSf1PxRnnFrRINGS5kfQRG3DOx/WwxmdLqmmxh
         ttknL7S5rF5bmHhbTDukLrymBVpF5aMvxY6ez8EYX/YIJHpcEi8zP6ha7oCT49hhwgxQ
         HixA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+mI/aur1/WoU+2jMd/tfz7WW5QGIfl8jYMGZSdqSQTrV3sC21wPHsI0ttHteYsc4EvTawYRGiDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwVFMeVgRvu41IIjlIjQxiX3YKBKdVtGO5u5TQrL5kMSDgdKz4
	apY/Hq5sQsSGgLqIS2QXUeAq61HwqEtcAfSuoDmndyUF/5cqQtrviKuUF8F3hejZjXOiAiEPCxS
	WmGMA2mwdwoJPgCUuy2/KdSDtqBl7n0Obxz+vZ393vVBscYT/AIY6Zqho2OkHlg0=
X-Gm-Gg: ATEYQzyc375ziNgUrOYFRqjIW+pNw+iSL1eANEDdhqSfxQ5JM5ZkhHevK/g3uQq/U98
	kePEaAZbbtCi2Q3xzMlGTykEa2Z4Yqve7oJi5LYeaAVPEilonDFWvXV+9bVSev0Mqk4KIUrtFcS
	a25SRA5mMSNbZqsQs9AFwjuIR9V7IWEaktplIL5B/wZGUxYe/1HWExlNQ4A2FIBAdvDkTw2Q/Da
	07X93MiRGUsEA2i4F/cL6mazQOB4mUzWOy2DaiMOG6YgU+CZOzKTkjYbI+45XyM7aLoRZg6W4LZ
	Gd29RGPtx784q1LSid4COD7EiGLnXdVBYZ6xoYfMwo2UESxoJQ39QtdSh+z2SHdAyuOEnrDunkp
	JXbNNSfLVw91slO8U2vHS6sZUSMkmiGP+w+zBaJovQiOB8iG7Wg==
X-Received: by 2002:a17:902:ce12:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2b0cdcdbb73mr180529715ad.28.1774948810545;
        Tue, 31 Mar 2026 02:20:10 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2b0cdcdbb73mr180529395ad.28.1774948810113;
        Tue, 31 Mar 2026 02:20:10 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm129254675ad.72.2026.03.31.02.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:20:09 -0700 (PDT)
Message-ID: <2327d5ef-f25f-4086-b543-aeebdb187b8a@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:50:05 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfXzirCjzGN3tXp
 8RDFTLPFZDWwLvqUZMnv633jlbrKQPTdJO6STwrBeNJ/z68q8HRyiAantGHJno+pAq4mx0TZW6I
 PNtEh4KnIisqpdUV1UnMqVvZ8WNYFseZOx328Fucm/OoPUyrTg0AsT0J4zYJXQ+NuEcD8x2VCLW
 y2kyvtzW8dHXmkk8iH9ZOGqxRyy4Cu6+9ex4q5A/Me3yIfRDuFlW5gYapZ0H9GvKDxl4ukcp2RV
 DlgDVqLwhBZvcj0ha1Q9HHqiu1Rf9iPeRsQY8APUZbpyge996BGwGapJB1q2XGOLQgjoKPzuY7W
 7B50cpHgctYG/RzFsX7EhaQ3HychTr6FOqXVOSxELtYmG6z7FiHy0I6w8kpdVi0PalufcrBHfdS
 tw6sC7NXH0HdqAjVBu8eNk7q90JraczfXREHHHYINwI4vI7E2fR3qB+Qxc6zRwG0UGxlU9OaVG8
 MGcaZ66CEGpUaAEJPcg==
X-Proofpoint-GUID: wUBZShtwZZPAD8YxWXKlYnCJ6l-9vZq5
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb91cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=lzig9Z7y9dNEH8IpingA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: wUBZShtwZZPAD8YxWXKlYnCJ6l-9vZq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088



On 3/31/2026 2:29 PM, Konrad Dybcio wrote:
>> Drivers for SM8750 video cc had the same issue. It would be nice if new
>> code is being built on top of UPSTREAM code, not downstream.
>> ---
> You're free to contribute to the internal template that these drivers are
> based on

The internal template for upstream code generation is fixed and glymur
still was using older template.

-- 
Thanks,
Taniya Das

