Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1262836B5
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314497; cv=none; b=lyk0PwiDMkqjYGsJh0AFyPuMWFD56H85NecRgQMhndrdqRNJS+c8ib3GWx9VwU9NN86vZogtoqlb2OafZsLXxGjGSGjPDR5WbMuE59qo3snAbRHgNVY1A0Q2U/7r0Iy/WGtyZsIirXoSSW5VUujmFnu9C65weghTgQJdVyyosIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314497; c=relaxed/simple;
	bh=GEyvcU7FVWlyZol+s2Qczz4gRoztqnhhOrtCtAVsLOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hacmTOw/zI1XxxQXZvb1vACoYY84gfHdv4u9WCJApe7P2BEcbNwYchTjnG+8uTVl9y4k0oksDI+vRx5+ZMQ1/42d4lQNxRrVgIuOmkSWdxfWLWFCjl0I852wXQsSeSBFEKu49vfOv7BJo83UmZQ9YyzmMtUPRG/LWMS29KjkOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVwp3T1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UApvqlWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVwp3T1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UApvqlWN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8Z7DB3728616
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=; b=HVwp3T1+/inN6BCz
	NWUQsSV3hwkOFUBII21ziJt1ElWKOqr4jhc3J+xyDv8PQ4QyntunGwkwBEFycXAD
	yBIpgkv1JpXwUlPLFLr7BzyQWxVVtcEQHgyRh8dSM/PL5MDaf4XPwU90CdJ6d2UC
	UgsU5flJ/56SlDpgrX9yjJySo8vL8KhK5ScP+PH+FrA5eABEaPvv58kvmB+yzDRk
	bfz8RLueBchiGRGJTNMjbf+wWKnHFSLXSL+eESk8//QKZtcs7tEWcKq5RO+KQQyl
	Lf7RydPuKsSdQMMFN8shOLjlp3C55Zcab5wGQkMHbT7oOBJYMOx3YZqU0hebQbBS
	IJbXKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu14nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:28:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bedacab1e0so217273885a.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768314495; x=1768919295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=;
        b=UApvqlWNOSvq4ROriQQha36tC8HzEdn6pfVP65CqXm8D1o6PkTjaUrBbjrJemsb7cY
         1JIor5BLAhtup6srfbPoe2QoF/8bE0u96s03WX1R0TbEnXbjv/FvLli6Bzpf3XLJqQ88
         fM/7uTK7tgxw4MM5WccjdcLctDni+NgPMr6uOtuZqzLK09WiHV5zgbkARwkc7IiKr5LZ
         tdyUMpQAQ/4U/frO4i1TxXI1g+BV7JP5f1disqsKui+dERR+Bmo1SZblr+VQkRcI4Jky
         9A4AkEN3i3b08JFyrUTorrQhjD5X83MBiN7+yVzMCs6hNOLfKkO9AFZ3kF+OH4iwP/cf
         jv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314495; x=1768919295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=;
        b=K7MC9MBf0fECKYIad/nhtzApePSf6UUAc6mq4pmNwTsWZjb2TYQb198h13DWWrDIyc
         NZgyMaCz50aZbmkSD/3aiggAfDDNs5aEPmOlab+qMRJQ1VklbXVQltZH5yOG6qoG7vA9
         HnodXBe1hTeBvYXV26mkPDg0CGWKr2gKft5TUmY88/XOPo1I0yTBBQ8slmoJESLoAdoS
         pAXovO9+JsiH4x0f8N1gx0n1+LP5rM4GGOrYtBVw87Nx5uXxieRNFa9yPw0ITgmKDDOm
         iw2OmDOyZUiWEoMrBQpoJkn7KVaIUy5cN47TouYW3CmGexORYKpWCZeQ/oEMeL4NeAMr
         69Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU1a9Lu7aDasUpesEqCfweffEdOUL7V1CI80RggtD19M2l0QhryHASH6abYBv/DSnYOn/V2gcV4J5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQuhVwAmtv3ByPrKMTMGd1TlmjVMdv8nd3fNs9gatfI32JrF4
	kFIfHa8sSHvBqwrRfycpL8ONMHRMYrvj97rCIUy7u8S/hV4+tzAePhKWT9//ylBbc0G3Fnc5WCW
	2AcjCUFBYl2Rp73lvE90WZGNalTCGagW20ojXvD4EZTPaGGUwQjNV4HgRDxxgu5Q=
X-Gm-Gg: AY/fxX5IqGGakimhLsbf9ttTwXKR/MO5tjGn5gg2ZGrKphhTLG3S33KFp4tPyAmBxpb
	zR419Brg/jgvFuCNjAouJErf8LqPkA+7kwKMBkzAn7TPbA2DYXaysAx/ExFlXCu/K+Kg4yChr+H
	JLpI9X3iYWjLWEoz8nihkC3/Q0kOGRVomNArLyiHBOWSBqqQf9ubTzVdp1D5IacKknM+Dxiir1g
	OIIWFerJLASSWwXF/itchS43D9G5H8u25M05ldxQhhIXbRFhLFD+3SKOVnPhs94irlSNW5hISI9
	agxyxEvkwgSNokb2UszjTngzdQdC4tE2tLAwJ74pJDkjbBUVm4sFQiUTz9GvEIIJ9ydir8S8LF8
	EG5sJR7H5X6mylGi3BVc8WC86DPIMZ0htZkfGG0yk5Hcrbkk/hiSBcKxMlBACE7pW7qw=
X-Received: by 2002:a05:620a:4107:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c38937c1bcmr2193463185a.2.1768314494837;
        Tue, 13 Jan 2026 06:28:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdjim0AtdFV39wYUK2oZNSJKlSOGQXB3wsnGeW8nI6+rx4ttssUu3p3UZw3cHWQcxqBahbhw==
X-Received: by 2002:a05:620a:4107:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c38937c1bcmr2193460385a.2.1768314494383;
        Tue, 13 Jan 2026 06:28:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f73sm2305390866b.61.2026.01.13.06.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:28:13 -0800 (PST)
Message-ID: <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GTZX3UDgsE2MXhzWKVEQWXajNEf2A7iJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMSBTYWx0ZWRfX6zMHpY7kfT0t
 fwRYVNPZlCT8ao4MJrqwXVRNKgZvNjxzBSCfcP48L1fQFQa2DGTlf3M3ZKoEqKlNTtmOthnXl8n
 I2dNqAfGcopZbvwch0ChFLLSi3C82mVY8Zj77YpnKtCKz78JNHgT0JBhX1O/zgUGs7KgIybofhv
 8dxVIDv0nm7+8rvBTV9FxCP5spc9vu3tGfFsw/RwDAMSn0RzMdJTZbbYW8aV4BC5tp5Nqg32F+z
 tk0CzfExeufpeSKkDGc9ztOAGXYVh2tZqY0jVmYYpn1m9CLU2Jm76mar0BhgoaNbTGk60ddcBpm
 2qUF62zehAKo65w2xLyWcT/AklQ/QdMv1Xpt0lrNnqt4ehuydhgjrunp7QsyN3lBlojz3i5XMSy
 5T24nq7635S3yITTOa9AoA6CHmiLG+UI/lVUvy2QJxPfWwrpAXkCFOckX8JE/Qz7N5va0FxbD6m
 N5+ivuVHD2DkaTujBUg==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=6966567f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9AGPOYKhFRli6DSTmn4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GTZX3UDgsE2MXhzWKVEQWXajNEf2A7iJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130121

On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> driver. This firmware is usually used to run ath11k firmware and enable
> wifi with chips such as QCN5024.
> 
> When submitting v1, I learned that the firmware can also be loaded by
> the trustzone firmware. Since TZ is not shipped with the kernel, it
> makes sense to have the option of a native init sequence, as not all
> devices come with the latest TZ firmware.
> 
> Qualcomm tries to assure us that the TZ firmware will always do the
> right thing (TM), but I am not fully convinced

Why else do you think it's there in the firmware? :(

Konrad
