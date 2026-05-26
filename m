Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1613E5A3D
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795644; cv=none; b=pVHohj/G4pwYfr2f7j3e21tK+TCAZ9lHKFCFyR5kst0Il+J4va5MnHjgcLOLe+5JzCYWzKFM72hW5TifwVHl8sB1hphmpI63UFgzRmXZheVrfgE/CZcpe3jRc9gf9tW7oIrS38dQfkd/pAXEk+g5rQzMzCgiXZLCXLtJP5lG5OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795644; c=relaxed/simple;
	bh=JBFoJ4hT1uCX+xbcr1U5qvxYhhuwb/y8yealtvnKI+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeyGtt5B8laeoaKp2CWkUaQ3lFk5dVEUpEdrTivfb8F/EpM0pp5Keid+YQIcea0v8c42a24xiOiDyff2Gj986EHCrdA5gY1++2B4U2nAxU0mA9bRTNNZ/YeQcDMUbteL+RmAOhbJQdr2IHFEepyg+DjNx8Qz3KjXUQd3qCjoIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lus2Hg6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCmOX6VS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lus2Hg6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCmOX6VS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8ssAK3658101
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=; b=lus2Hg6hWVD/Lvw0
	a/WSuZPrzBJ1wdgjRoztvLzLVSbxIO0b5jdcKAQ3qMz0pKfwnKazFXX+NAv5Uh1J
	GO9Kb+AS1ZSwJglJxzx8xs7SGKmuU2Er9bBh2OrrOTkOT5vZoKzPTGooa87Z7F/E
	Drg2lW5jZdbOkPoeeXTChzTpQrYlsyAwQ+DbBNBLlfNM8f/rFiPJ39n38PJpHh8v
	Ot2p5LuZlmdMov5yDtAu+nI0zGC4xAxL4SpJGRQTxEIXxSlYMArsWioiUFAOLS5O
	J03td3n++mRkTQaYB9Jd5+rpaa1fJtL38M7g4epaQZT51I9uUWe1HPJ5CLSGqzXh
	JilIwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbn4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:40:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso6662578b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795630; x=1780400430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=XCmOX6VS9Sl7APGJ+zwA27mJcKkSTF8g2qf88JED/ycgdkeitjfe0KqR94CcX7KqRd
         Y0fL8TksQ5ceM3X2ekdJ3VQWrxT2rACDvY9z3t/corBKpg+tu2Da2eZ8BJtJvqhPD+gD
         ATulZRu0GyiEx7pluyW4N4XbkHjeB+Vf9Vp55aqe6eGj2wus1gSlsCo6QRjmG7j6wDpr
         id3zUlbiflyzq7mHy5yWKTj4c0bLiGVAcbgtA845//FQwJQOXwe5AueQznRHEOCtRJjG
         MrxmRCWAN0IIDYubB5Sy12C4pujAzzu7ZNZafYxRIzLBLIYC4bct/qefuX8LOHFkAqWA
         yZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795630; x=1780400430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=iJPfFPl6NhkzcqnKnlrJ2EpFpwT0yS2GBlqg71GxaYftyOqcz1bRgQM3RLiNFHcBzG
         JunXVY0J4AXp2ox2QBMksbc/TrBpFhTw9Yt8P7az39MqT2A7F4onKaRGgmOf0tu2uy7g
         YgdtM5G+NJ5iK1LggFsXsgH2LcPg6PM0E/sj2bO0rwrdR0RMFARKtOY4T2dXhH2LOpQK
         D7z38n/phRYtwU0/IUF2N+gE2cCcYh2sIvwD/jc8U7GQ4ZBIiHVS0VPCQwQkuFRK59bd
         2AmP2HsZv9VKSpyOLVZMkGJBHtMkbToAZJtOerX3IogwJNljjiJgDn5tq6KdV6ME0rDX
         AnGg==
X-Forwarded-Encrypted: i=1; AFNElJ8Zn/kNjmJxqbz3Ovlad04oJDNKLawX8TD3mfXgR5sM3To68a4ofITa+UDV70O6diWme/l+s7FvcPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAwoLzRElehQp/04q5dv3jBcWa0YxTerghKgZo2yuZ1pzczTej
	MwLlFLf7oh0WK1sMhxbg4HXWloMmHzddEjP/M0o1/dbXZbrh4y9Pe8ePGgIeoIoG9TewOLB3tud
	pZpYNh/HmdUY/zVCKOGJDJu17iegC0dmLQ3Yvo4JjN4wM+LbFsV5mFBh2cHI0wXs=
X-Gm-Gg: Acq92OGqNSySmzSEBEEbm60YSjNAXvxzFNsheDZ+ujgJV81IHk/JmkBOYMoI3MUSGyW
	ramPI+SJCOqWnSHbhesN8Daj/vk+wjJ/pWjmpXL+FIrqrA04UYCGISQhNn+AfQy2/aanHbg83C7
	o4qwgTE8qK3p4xu0JdyK/5g7Qkwm8E3jJ0beSrkZoptrOwxzFQRalPkHIgWcnwfF/zHQSI9qKte
	UC+3h2FSsuL+Wbo3ywQd7Wip135cNKJHH9QU7fiJTc3QPqwnPGh443dbsK6g9f2CED7bLLMOM7B
	WMId3su6H1SZx4Z2FiXBzWjmJZrK2oVmlkXg11lllgqeY6rvkfZr7tpa9/uGzOMimZa5qsHGLnk
	YT5qipyQlFqzh6dsZHemdCF9YvjASR2SIgx8QQjaMDoMwy62p
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834766b3a.10.1779795630310;
        Tue, 26 May 2026 04:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834735b3a.10.1779795629827;
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1b3d2sm13869414b3a.26.2026.05.26.04.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Message-ID: <59167c7f-c758-4939-b760-b6de78c22359@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:10:22 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
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
 <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a1586af cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SSzA4h9mN1o_gDQ-MaQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: DVS3jfzOWW7FDqQf5t7MYdUyN7vCTkPp
X-Proofpoint-ORIG-GUID: DVS3jfzOWW7FDqQf5t7MYdUyN7vCTkPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX1WQnF3vQY6sX
 IkcNG7ppkifjhKVlcVn2sfaZAYiCIpVbAsBzdaUkx+ZqqlrAlCcTjyI8/ct4ZE9VGrEbV0z0gs5
 IEdEJ+c1KJx589oKv6QD9TJdtM5LwqRY6IShgXieZwRFUVkA21bYdmqkfOhUG9dhG8NgnsC2n2U
 UvQB8+KbXxglhI2yy/fHjlWtbjXEPR9aXWGk7EkIMunwqMgYU8i+pqG0gXhpbiDqr9fqdRjMS/5
 JH2hNrI+bGjfEIsTd/BLjUX9DKOpjKnaVQc4YhcsWNVFjCs97YFpv5MR2nAPJE3GYiCswzBdwUi
 RGWM5t+5icXMFe7yCCYpMocGdLR/oDUaNy9UpCXgrdWea69CJjgGHWiJH+vSKajEI/zTcexGRI2
 86+N3J2bZ/TOymjbOvbvGrwzt7MbtolB4ZqXSEyO7UCTQY3UnJAtlXla3p4j35JV4toWYrpM+n8
 38vZ2ZOnx8ae0db0g+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101



On 5/25/2026 4:43 PM, Dmitry Baryshkov wrote:
>> The patches have been tested on Qualcomm Eliza MTP board.
>>
>> Changes in v5:
>> - Taken care of comments from v3, v4.
> Which comments? Please be more specific in changelogics.

Sorry, my bad, it was the 'sashiko-bot' comments.

-- 
Thanks,
Taniya Das

