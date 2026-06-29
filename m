Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49832DAFBB
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710423; cv=none; b=LMxBSjw35W5rFaSMvSqZg8cV5+2toXAPLJyHVCbYpHZ7EW+JOx0wYThU7/Hh1XNLjPwWoLiQSqBFo0+l1Of2caPBH9gdqSRWfOmmkJjSKavek7+ugyU2Ihk4IK0tr8WkIKQBnOc1MjzyxHrTwCjwWvuRXZ+3AcMVYl5SPZy4ILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710423; c=relaxed/simple;
	bh=M5cCa1iVKpsWVGIuNxKOhrB+F0tmxzUPYJVS5X/XoiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNxno14+V4s+EYK1OCc8g9+fo+l59yfTomU701ZmEKkaFBqNXxVaQdPhm+mhh21vFlUVi/QOw2WFWywt7ZLqtMHE/AEZgzMLpZt3seISGvk1Bw1WsOt7x4VcAIdpZqnDnaDjKxFH3PK3FnkwoDVdNaBrWhfIWpSVd6afZi1xA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVu2TdCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XONmzrUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVu2TdCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XONmzrUT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NFK21718981
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=; b=mVu2TdCwyS19rlFR
	6KlZTMiAW9qLp7Tm8Q8PAy3Tta71wOgGy+PhpIEGDNQ57zkvyM7m7J0SyB/X7TEo
	kfVNjzbrAbB8m6dbRnYuo9ikIANZm4oMbaMyv+HGdZDfn4WrieJxL4a+VqotNKvQ
	lyNMoTY5Z6fbg7T6LaXmYyHOvitggSVbExHHTy1cc60x7ZZZ4o5Ip+unu5Fwrjo9
	H/MyS6L+6UQf1ccUag9VazIYxW1o8T+aEiTHAtRj3LzJ19H9rNMMYqAQEjYHJmF9
	ACeP7jnZ7uXel6aZU7Uy8LaMVp/mhUiQsaIYzKhLHQzL9cqsaX/KyvILRiZPQWxX
	7F0UpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4ehp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c81db324caso20804595ad.0
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 22:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710420; x=1783315220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=;
        b=XONmzrUTUljgsln3cZqcdDP2hnUVBlGlL8rOt+9P4Fe+cx6rC1XyEXwZ+zm9EHgWD1
         aP9wzg26sodr0H8d6+kIUrwTTMNsWKzpZJZGFBILegPQNxg2vXBmWQxELGEt8zIZx9Y8
         IARPqce7qWgr13hOxO1FTQC5n3xTcMBQlENghnXmd6GbCRXMtHrpeOviYJzsJSwvPZAo
         Bd7Bel55C6nUaBwwKvjHRIdNlRyWf9cIxzpkLA5YV3txx5305kHFnb0LS8YOEJNq4M7Z
         So197x3UeNMlriGrwe9UJMvmJ6v2qWuHdzZisHG8nWbRGLNoqZLBQ9Q3dtKVWOUZNv29
         mooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710420; x=1783315220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=;
        b=iEDVY6XZgGaN2CsDw6hRuBqsHGNEldFSbfoRBmw2eQoCVrObgyJA5digGI+EBQ2gnH
         jfv9EVVIIiXLsoYz7KEj7yEB1O5EeF4KZ46i0+VnDVQQUlCO/PQcCrWq23fkZDXTe6nE
         nXD7j950tuutzi1tEbAXgCaloDMecgcCzABqNX0OM/y6PQCJofBFHGewf/fVp9Po/aFt
         Q4TQkfyZvyElVr2EfQc27CKKKjU6WuXaE/kTGbMxnW1gPh5E79vCxuJH5pUjV6XYU6sM
         hw9cnpF4cPVvM/89kWTpWSN2khQKPBXBN1iJOkIJ96bYwmwIxIK1HcZSMmViP4/rr9Gn
         pyag==
X-Forwarded-Encrypted: i=1; AHgh+Rq777s7ZiFTL0hxPff7O0j6y+K+j7A6+fwQrpwUzOhtVHpFHikTYSFES86E7m+u8dXYGTD8aMxBlwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9sJTFuANs/2+XAVye1hA5ri7TuHgKq4vFMS3X8J0iHV+yJnpS
	cPHHt1K0J/c8QkzsK4q9qFj4PtalM9hucnivQbrGxitldmelhBdU/QAI5mQI930JfuBtcliA7vb
	v9d/WmYP9VfKJwwBSa1/Hog8e8kswlVEFYHYUECpNG27B4Oe0Y0v1AEU0rdhDVcY=
X-Gm-Gg: AfdE7ckzFWoRkyor9a1ZbmO8jR5Sq0OQ6ohAERWeHkz2GxUBD822QXJd1bU1TzyAwft
	5kHKYuaT/GkTTyjxrksy2slOwK7RcbSQaueWdaWLDojrGqKdkS8dms6yCAwu6w3PgUdySjJbJIX
	bTTfV8b5CddZIcEmp+rSweIupBWCngHgw35Hw/fAivs5ju5UZRUBCVdZI4GQf9Ygw8KaG7itDhi
	sd7RL+M5QwO8rnf5/49lp0lq2tRVl0QFECRMperAYpVFDlBrqgNC54ybM+eThKpaYZtAR5SoApW
	fhfYcKjGNKZ/P+KJFTOX0ppt/OyAGngL90ddyNUUfGcpEhXn/cOPXyceUz0knBdPMGzU618VcPZ
	IMe5KYretyz5TSXzqRrneS5nPitX50+2PR5yb5w==
X-Received: by 2002:a17:902:f644:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2c8e13af2bdmr84668655ad.28.1782710420473;
        Sun, 28 Jun 2026 22:20:20 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2c8e13af2bdmr84668375ad.28.1782710420014;
        Sun, 28 Jun 2026 22:20:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b3ca81bcsm36277785ad.82.2026.06.28.22.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:20:19 -0700 (PDT)
Message-ID: <78abffc7-3b3b-4fed-9d9b-cfa9fa3778cc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:49:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
 <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX0WIS31DLWWtE
 eaIDprKYIIaHkvJnV2h0/NQyJX5LkxZLoSbkmfZSrEjXDzatpoPwwMZjMKDexZkK9ZNTpisN6HI
 P9YHGh3u6AVHa6JIBqZRJE385Gapep8=
X-Proofpoint-GUID: EYzSGGpGgZ6fmgJ3z2v18ywL2apnttA9
X-Proofpoint-ORIG-GUID: EYzSGGpGgZ6fmgJ3z2v18ywL2apnttA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX2pxQr0H3nCbu
 WCsgEKRnJA9etTAZ1NKiZF+Y+jepEMTBa9pBE1j2m/uSqMF22grcTtUt4Q8L7FzFo6tnsEYs28V
 LwtmyoTye5zyY9ok9+d1sr5j2MxjDIMoent55rgnpvBb+I8aMfKoDs5DzoyMDIvujP/uAvlkY4p
 srM34EBxPh96q4TULY1a/ReAzL5nkzLZRq4k/p2+ckSH20JI7ckq2AjYLfzUzWmL41VycIXNgmT
 ERSXKFU+ay1igwXoozEnf24Wsi3xeXOUe4mx8ioUfyTNGiqJFkAgNyPc0ZeprCNoG0ztfVdFFY8
 rC7/jpGHu5DH9JGV7qIv+m3GZhOz4tDgUyjUxFexobKHoJN6nG6Tq8qBlxKGjLR5UwfoHDobPh6
 fi3LKpZtWcIc7vzb0EKXN0jc98ZCjY5tQ8gyUVEWFyZdDmkjoW8fPwDSjTlP3s/gv2N4CA+GD/F
 bu25rnMV4foD6Kd/aJA==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a420095 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Rk4DF2lalsHHy-5JHz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043



On 11-06-2026 04:57 pm, Konrad Dybcio wrote:
> On 6/5/26 1:26 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
>> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
>> Audio subsystem enablement. In the CQM variant, both clocks and resets
>> are required as Audio is on APPS, while in the CQS variant only reset
>> control is required since Audio is handled on Modem. Handle these
>> requirements using variant specific compatibles.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct qcom_reset_map audio_core_cc_shikra_resets[] = {
>> +	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c },
>> +	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30 },
> 

My bad, this also should be controlling the BIT(1) only from SW side, 
similar to existing drivers. I will update in the next series.

> So these are not "real resets", but for the sake of existing art, we
> can keep pretending they are
> 
> bit 1 is HW_CTL (1->hw controlled) and bit 0 is taken into account only
> if 1 is cleared
> 
> existing drivers toggle the HW_CTRL bit (meaning it's an
> maybe-on/surely-on switch rather than off/on).. do we need to rectify
> that somehow?
> 

No changes are needed to the existing logic, as Audio SW only needs to 
control the HW_CTL bit.

By default (PoR), HW_CTL is asserted, so the CGCRs are controlled by 
hardware. For the audio use case, where HW gating isn’t required, 
software de-asserts HW_CTL, after which control shifts to bit 0 (set to 
1 by default).

Thanks,
Imran
