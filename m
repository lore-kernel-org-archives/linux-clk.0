Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B43F44F4
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946490; cv=none; b=RmOaeHl99H2FoSwA2cWzwyYH+AHgfJ2kBdNTKWvaBs0ZhGlyqeC94G69xiHacns6+Jpp7Nmo6CWTpb0lDIoUQZtrZBO6YpAhimzhU5OfxJCV0oHjXisrbjv3VQkkC+UtjuHvrYCldJh9S00/d5vd24rDsqswIlN6mlOMYajg3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946490; c=relaxed/simple;
	bh=UBOxMe6snk03H8KXANWmz7YZ42iRMomXv9GvPgDwznM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqz38vyEKtRGBAySA+ukC2gMbfI6g9wr6wrC+sHRSUW7xO29cPDUgNKWTC2wzhHcAghElbgaKlx5dO/0kdEbFvPaG+2yvssz8Zyp2iSZdGWLqMQ3By/r3PtXt8yWQuSWhexZjpZrKJCvV+75LdcMOYTzHrUjIMtVlmdcH9QNp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD/6HwFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYhuJ1ir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XD/6HwFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYhuJ1ir"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCELdQ1333515
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrGlUkd1t4tn4Lj9oMaWKZVCqqsTJkCgQ0/5kZcq5/k=; b=XD/6HwFYjr5XH9MY
	nCpy+idC6tc7IkGGKKiZSkY6zTI/iBuPAjUjCAxKmcL2/wSFS2N1lnMGk9sZcW5e
	Y1yxI0yTBAUim9RCAj/LalEIoO5Aq0absAuzLb9/IorXvhpyFg9MtP9TijOcbfwD
	bu74FNh6W2aEpwYhkBDbsNaXvaJk+YukmqcakHnHeZYf/qLIsU2Lxx7efYiP+ehJ
	yYNeZlGGCUwWBgG9KQJyloGou4LVJytUQbttySqsCiKQXYNOYUKrNugE/zpbAUR3
	t0Hqt0qnXh+sHeZsqLQOFq2K0icAa8l9vxnJqIPYbLzI9RS8v3pprPJSGqYez9um
	ljgYJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hh8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:41:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso43937951cf.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783946487; x=1784551287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrGlUkd1t4tn4Lj9oMaWKZVCqqsTJkCgQ0/5kZcq5/k=;
        b=jYhuJ1irf6MaSZEceCPTwAyvaTMLGJpdy3WdNQfGFfsQuxBhvAT/9bqyrvcWmOQ580
         kKhekHkG1I0rzCdIlb9M7LEm8pPJAwbSneAwQA84ipHxlmWAf7kp8JpultYU2cB1smk1
         x/9Zx6pO7bXG02Kn2yJ3Zh8uLa5Gq4wuUaiZFK/afp1ohvOva00adHm2g21Xq9Da1AgZ
         c7+SJaCX5QduK7gOLfZhIRxVL2T63dblDAPbNhPjI5JiwBDkwVX3oR1khe+uvWy6DYiA
         P15khJMJil+G5DVJP4R/OK7oz0hADj62LAJHH3bPysM3ZijLQx2+zwyugN0GsOcrqyAk
         HP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946487; x=1784551287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrGlUkd1t4tn4Lj9oMaWKZVCqqsTJkCgQ0/5kZcq5/k=;
        b=LHsJUKD+jlvWg/TOsgrPQOjKj7CzwXlNhXBojgAkkFlYmrrh+8uI2nin+pORUireoG
         TMSr63gNmyM+qG3T2hVblNoXincTE5Xqux86yGBoY5fkes+VMS4ZBeQjXRrEOrEGJxVT
         YuCd+x2DvSNfwt40SZGrFPCSq2T3ZFp288qLJ+R4DT9korKWEs5RxEYytqyVwJ65fFe/
         aVIw2gxBv9JGDzje4f9m/DANV3mO5PAXhczHYHIft8QLbUAA54kSAw+Ih8YI1Li69PQS
         qcQqFOKb30+771S+U8OwB19c8csFzmNeuTSuaY6zfLnVtyJh0KQXdknteK5lhPM6o1q5
         ruPA==
X-Forwarded-Encrypted: i=1; AHgh+RrkQa897j+ALERZ/Tl6ZyLLV0WwIVeqVd+AWLwfLPRi6lYI/4icu6YIpnoJYfg6jkIOR7ibV4HCp4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqN3ATznSj8C7M6/pUP3q9nwlbamHRWst3clgGAzAfNHdfD8I7
	y5DEc7NvlVXKPGDMkulEqzzFPtK85JGcxHwdnIcGL9CG7mkgibAVMegELxMV/mGpTsKFSkabspp
	Ud+k03T3MPJh2/pvxBzzummd43bzzr7kM5HfDZcYD9LFOBlhVt0dBixEPTyz3AuU=
X-Gm-Gg: AfdE7cmZmNdLX/ZAVJ6XYg91RMX16cI9gUd2RhwC+RWPpzZ4L8ht3rP92uOdgwpLCHE
	I6ZCfZpkpEOAsUbGG+1SArWU4Gj5Hh+4ACVQWYXg9zXmlQjTRMONYtNEAn83+P4//8l+GpYttjM
	ZjcFjra6QS8T86YUBLlNJWILbi/WQqzNHYDWQaqczr2niYObPfNgXg599ibrk7XhjjmvFNyhwiy
	rq2f/Zd08RqFfmNTA3quoPr72bWlr1+bSxyGp6eLSkdORnr4FDS7DYcrhGr7aY5pzzP82la2wWU
	WW6McIU4d678/mweKHiaCiMLlIMaNhwyt3701MT5u6I4kz8fYHHsd9gxuXnjMB7kfqFfRc/kwm4
	DfUIS+mbuO0eWouA2DxwuYILM8edUEg/CWJYee6KXuw==
X-Received: by 2002:a05:622a:1f92:b0:517:6508:e1f4 with SMTP id d75a77b69052e-51cbf213d9amr89229601cf.42.1783946487172;
        Mon, 13 Jul 2026 05:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f92:b0:517:6508:e1f4 with SMTP id d75a77b69052e-51cbf213d9amr89229381cf.42.1783946486759;
        Mon, 13 Jul 2026 05:41:26 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82279csm1024472466b.13.2026.07.13.05.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:41:25 -0700 (PDT)
Message-ID: <eca9432a-f633-464a-a94f-fde20dc61ace@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:11:15 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
 <20260708-talented-refined-kelpie-a68e05@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260708-talented-refined-kelpie-a68e05@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n8r7wbpcseQA5E3Nyc0f8J0OPJD1UlnX
X-Proofpoint-ORIG-GUID: n8r7wbpcseQA5E3Nyc0f8J0OPJD1UlnX
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54dcf8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kJqTnYqXC8In28SSDhYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzMiBTYWx0ZWRfX2rRuXSfz5TCP
 sli2J1MvNrejax3O1KN9Oqa/vr8hC4uRCyOz7hcVKVxteI0d7WpKbo1xzB8MUwnxHJuCyr+mjxU
 taVzV3ibqOgQ1rQLw9WQNIjPbioll24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzMiBTYWx0ZWRfX58TmNNifpNks
 wkAVM2JYlb5ng0oQtED3E9zNdkDH3VycSkOpcyKNN9z850bkld7nE6ED0+1C5FIdEyZRdfYLaA8
 R2a9iGBqfaQ1FTPbHoF0VZ7z1ZjXHoI3AL3tv4Sf180VdaX4jxT058y1B2vLgH+Zcg+Ow6R3DeL
 9NWbmc5MrTZyVkVO69BRbFNfK7apXfJ2Jjok5xfnXvK4F77RwsSiRoXjWnE5dF7kPaS0SmQ8L1h
 w7uAwNgT5a4qUOL/caqlQGCWJq5KT7rRMoHYlSb1lMOVDYFgnSDyUg32i8fGL+VZWKlM3dBW39S
 cPgPOm9oMBNWTSA7Py5F3XDNiDaB/ld24+ykcEi3GOgsA3khkViEMcX+RmVrDJg2J50lv58eYXz
 BuRqU/yLAkvyPwgZ1+6uQxVfRXBbJr0spBkyGv4W+VHQvMHIcKItm264Q9c3wopmvrRMbOxdWBR
 Z/cxrKZxC3ZKsIGqLmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130132



On 7/8/2026 4:27 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 11:43:10PM +0530, Jagadeesh Kona wrote:
>> Add device tree bindings for the video clock controller on Qualcomm
>> Maili SoC.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>>  include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
>>  2 files changed, 52 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index a6fd1992d6d2f9c05751de2dbf2b53fb96de2958..6281e5ec8036b99ca21740c7f679f4b55edbb87c 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -18,6 +18,7 @@ description: |
>>      include/dt-bindings/clock/qcom,glymur-videocc.h
>>      include/dt-bindings/clock/qcom,hawi-videocc.h
>>      include/dt-bindings/clock/qcom,kaanapali-videocc.h
>> +    include/dt-bindings/clock/qcom,maili-videocc.h
>>      include/dt-bindings/clock/qcom,sm8450-videocc.h
>>      include/dt-bindings/clock/qcom,sm8650-videocc.h
>>      include/dt-bindings/clock/qcom,sm8750-videocc.h
>> @@ -29,6 +30,7 @@ properties:
>>        - qcom,glymur-videocc
>>        - qcom,hawi-videocc
>>        - qcom,kaanapali-videocc
>> +      - qcom,maili-videocc
>>        - qcom,sm8450-videocc
>>        - qcom,sm8475-videocc
>>        - qcom,sm8550-videocc
>> @@ -72,6 +74,7 @@ allOf:
>>                - qcom,glymur-videocc
>>                - qcom,hawi-videocc
>>                - qcom,kaanapali-videocc
>> +              - qcom,maili-videocc
> 
> This I plan to drop, see:
> <20260708-dt-bindings-camcc-required-opps-v1-3-ae0871774210@oss.qualcomm.com>
> 
> IMO, this patch should be rebased and come after my cleanup.

Sure, I will rebase and post next series.

Thanks,
Jagadeesh


