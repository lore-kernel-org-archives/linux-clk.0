Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9403B4E80
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060097; cv=none; b=Vuwt2TkT1vjezycTPL2NAuTjUnq+KFqxnENxTaaBS1m2HdtAiOL5LQbj5LYrTXok4mS/pcBE/XbrFpyUOM/4c79NbT1+xAp/D0s8lGYmerg9kRl6bmyzoZC4FsdZSQ4yOxUHXe1l2HMVECHWJJiNTgICKjXw6SqG0lxidlczfa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060097; c=relaxed/simple;
	bh=dwxOFF1jIfAEdxzcMU7a610M9f/ZzdmCVIYiAVML4Lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeqzV6UeyPNLKj/bx5jb8CUU46lavXsE8TWRJZCcxBBV0+XkPuJ83Al7wTIj8yHHT+exi0Qe1r5YI1TOLPcXAndnT8/JoeQ555UnX5bYbVPAGgEwA4vFGecdFeUECSwJXGdMYUl3EyP3uRACIUcc0jznJXQIW144s4+AB9i/138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtQYuGpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmGBrPUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtQYuGpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmGBrPUy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AWbrR1587275
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 12:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voh86L/vAqmB+vDtOZ/7vMT01dDlIpm0Ps/jEPksfNg=; b=MtQYuGpUMCNwSB4P
	w28RoLWAfAdxUgoxEZ+jQVp+CflWsyyndYJrUkAkl9z4MUoeB/hfiqlSNhzdfh/O
	xbTUG3nZmeL1Z44ivYqcaJ81MML/Z8kx2X4HkSsFZ2tYZNI/rYCj70zMqoeFBDSK
	kdnLaAeohg6AspFpanp+cDJ0t64rEwPb/4T+X2AbkFm+265o0dGVE1ZTKwxXQZpB
	Mb5KbuvA40eDAOoVc0n9YFBrCIE/TlhMv0DTVXvYT9KJ9lTnuixmkNj6FLlhtPhi
	/iOyuSChL+p0LWw9gNy1By2NuGRd/FZczNZuHKAUgxTz9igBpUgMKkrHzY7/x4WK
	xq399A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy9had-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 12:41:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8ea43d4eso27475885a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 05:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060094; x=1773664894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voh86L/vAqmB+vDtOZ/7vMT01dDlIpm0Ps/jEPksfNg=;
        b=MmGBrPUycaRTtrHO6bBY9Ejls/N+/Ki3w/urttLt/ID15XtNANunqy+S7+6CjoOXa+
         Cp5rmadcB/DI9Dd2kErx/OMSJX1r2k7fgJgkBt1ovWfhNu4hlqeeuRe6lMxkaHrBi1RD
         MI+PMvYN/hTgS2uJwD1wY35aAmiFXq6Y6XenFFOK27X8IQsDEJTQkbuePbG+0SH8hnU+
         G+4pxSykR3ljcMBgDw2Z5OPFx/vf92LNURKYMOkFXue1kVwCsW/8J7SKM/QOsGKQfsYN
         ClhJ56/J14/1LHqUULQQUO/Webx5Wgv1YQ/H0CjAXBryqZR8Hv/mDaDsLRJ1WpvLg+OR
         r7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060094; x=1773664894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voh86L/vAqmB+vDtOZ/7vMT01dDlIpm0Ps/jEPksfNg=;
        b=iLrnnf0JBDs2uC5rVT0HecwXN/lKBd7ccWz3jF5NQWfGgpsPgbqtiCHspC+zcPcRhM
         pCEqqGS2qYUD/xhxrJxqaz5fpHq5aNsJUzJs/PQchWM51cPpA0rlyi4uO/7+9DOmXy6K
         GTLj27yV402xnQRbtUyhktfD3b9fNe93TOrPrcRCE41JmcXtNLicA7I4GVbvvjy228Vu
         cMnTp4N6eIoLi92qAmsZNwZjLVF2oHh8mrLdJpitFroHiGMs9Wupa0ATRb1W1hTRC1j9
         nLLF/4l2ylgSuyjRscZnZfqwOfg9+KCpIJ7wZVCz1F1FW4pFcsWZB1hvvHvHjWlRDlF0
         jxnw==
X-Forwarded-Encrypted: i=1; AJvYcCXb/U8tAeHOhXFmeIssKqjPYSz6ijThQYqCU0xeDtOlA0SgTzqnqTWGxThG0MWIEoz0r0dJlXQGNh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgSVcumiiG/EN1Uwd/uk74cvIggsaArdrriITZK+PYFz3gNrb
	7jmnGEl34lz0SgnKep7Q/VRdOUnAnJXFAZGEexqjRgBRrGVM0QFSEQCFPxmjyznyM+y8E4ObMNb
	5kduCSzCJ9b982qz/vhkN3KveaI54XC/cQmXbvWt2NlJOmntwIG/fKSFWfX/Y824=
X-Gm-Gg: ATEYQzx8M6DWVcqvtYg2hO0QfZjyTTynmT5S8Vcubzhxd5SullwBI2dLhIBfA/5yg1U
	BfkR00ALD9KpvM66lER9H6tZ2n5T51zc6CZamThlj3wtlBaIVA9KpxhvCwCNCPUrBNSocmYFRW/
	9X1NuLP1iKqDCtxqtFY45m7yywSzzmuwwOp4eVytvyrCj3uLO0st4bLry7MLNmwlbobELEXcwQy
	txJLXMmrsE09N2/C/cWzJgbPGCptGSIVv0R18q8qy5JiGXL7jLW65vxDL32LAJRaLDsR6Lzo3zS
	CZb3fnn8RPCuRwNKR3c5h9j3tm/QDcJurTmA/N0gpFO/u+d/Du0WTtR8FveRxMRvj+S770hD2IS
	vCZ72lMo4YZRxeoUIoFNK2JdyzP2x8BOJZBv6s3SYpaMvF9FAhiPV/eEMikOvn3C5kX0aCP7C3F
	TGAPw=
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr254713885a.0.1773060093622;
        Mon, 09 Mar 2026 05:41:33 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr254711085a.0.1773060093214;
        Mon, 09 Mar 2026 05:41:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d6dsm3210909a12.6.2026.03.09.05.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:41:32 -0700 (PDT)
Message-ID: <9c11fb4e-70b0-4d01-939c-853308806aed@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:41:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom,gcc-sc8180x: Add missing
 GDSCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-2-val@packett.cool>
 <20260309-soft-beige-shrimp-28ac6b@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-soft-beige-shrimp-28ac6b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX/j1XyBXycArB
 l5TsUd48KfHA6+2gygQtkrbefQOriOfNANGN+OMdy1bQfPNlUuUcsfKAtg7jkqYWBp/7612dy5Q
 7AYaWuYMkcFqlZc7/J+DgkW/ro+dLWO5FByA3rGQymxO4T5gB55NMBOfHz2fi0+N3z7b7d9mP/f
 ipEbJJiDr7RGHNSMtmPTKmk0CkYtOvjIfx7GVPW/UwX8C3aypml+fCQN/LE6264ywsAUDAKRQEZ
 /NqUm06MaAn0GJNNhgi21KHeWMT41bic5ai0EvTy9lYlaKrUIdXAgOIPsWcUrrAO2yiX295LAzS
 P2WWIqJGmWJVAEXD6CCBxKYtSnC9i6XzlGvtkp7iTtRTebL2WKIfTfbhNGTzPCjYF9WX+kfz6eT
 bcxW4SNnNNNT8XP9nS7NS/HprcmR1S2vKMlj+koYsppSMHQPXS3iwIstXOmg6IymKCxohoOz/At
 /bHmnq2hcg47qsIhxzw==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aebffe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=O5yhVQSBzkC3hkWOAnAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ul6gfrZBvVxVrqSJmAgxmkBhvKSwxjhW
X-Proofpoint-GUID: Ul6gfrZBvVxVrqSJmAgxmkBhvKSwxjhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090116

On 3/9/26 9:04 AM, Krzysztof Kozlowski wrote:
> On Sun, Mar 08, 2026 at 10:00:23PM -0300, Val Packett wrote:
>> There are 5 more GDSCs that we were ignoring and not putting to sleep,
>> which are listed in downstream DTS. Add them.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>  include/dt-bindings/clock/qcom,gcc-sc8180x.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
>> index b9d8438a15ff..9ed7b794aacc 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
>> @@ -322,5 +322,10 @@
>>  #define USB30_MP_GDSC						8
>>  #define USB30_PRIM_GDSC						9
>>  #define USB30_SEC_GDSC						10
>> +#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC		11
> 
> s/HLOS1_VOTE_//

No, this is the actual name.

Konrad
