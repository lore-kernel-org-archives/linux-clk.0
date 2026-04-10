Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA52E6CA6
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800012; cv=none; b=IXa0cPSkswgG+7Hne9zdgqBjk4EBzlzBnmBLnJB0J6WT0Fv5CVjanAICRn983rpwYI0JZblHKe5624MhZWbKAACZMoINlEUxRBriquoYUElNHQRCYKRqyJdE/ICldQ/3ql7bCRVE0H33mLESUpFI2n+cxAEd9tH3vSbgxYGJANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800012; c=relaxed/simple;
	bh=fVzL+sSlRd/KUXDLXjHDnh2hdZ+3zOivohmQPs8xrBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IptKxJOkbpXVomuzzfiRfKf+8gu7AiVKJCCJIS08gDjfIFhJ77vlJBi5sGtIAPq/mDkEM0t8uneKs1IyWdARLPGe5oITzhyBhNuGneXYlpcvKxKwYIRVGnn+csqM+SO4gkN7msYQNHp5d9oXnaF26h0mnp2PA3SFWCgAzZvBp4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fW7Yvbv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnZdc7/E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fW7Yvbv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnZdc7/E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639NeiZn115215
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 05:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=; b=fW7Yvbv3HxYGOLVw
	G2nvFRqIJSayLL1KpAL4BDQiL0UzERgrY8ZutytnpNdpckuepgm7r+NiEMjCJ9PA
	NeO5UPKcX7WlqcaghjeEnGBuscga0ehBLsGvuAkAmMtg6P/dVlkrsB6BkPepEOG8
	M2rOR5lhdtNNr7CRMBufIMdQggx+sY9e34TAqGQZeDGuK7Ld1UiHMV0BPBzNBzbg
	Yf/U3ztKrj1CS+7b7Eohk7rogzCc3jCjbui9rTkEXMWjl49fHLZhHgFd/tDeCTpD
	djs5PayfXDDKMHmhUr5Wv6LioMl5WTCXlwpB/CltScmEqVYNz556xA1GdGcg2loH
	z8L45w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xafxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 05:46:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so4716716a91.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775800009; x=1776404809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=ZnZdc7/E2/ji73pPliptNhTBJgxTWX0nvX1uzNw/T+xyvx0/hSja2qgOrhZTFRvLvp
         BQ9RdFQiodmQLmgmkCa7XNxy5+6JQpJEUZWvqE5firv+nCyMC+5ptzqrvozr014JRhuK
         uJk/06W+CfVx5hulZMitCyu5Bap+JQK2FdjNeVPuw4RACAV7rH21076fwc7yj3/h6Htc
         NDCludImtElOktnHVdNxJiCz5sc8GXrNvdHp/f4U3yNPLOVOXMqfFUyBpMYXRYhIhkem
         RtH8wdjOntA74BMgn7UBs7rJOBUHZRmEh78WDvdA0wedIlKlZjc9IS+5VgckaUBtM+4M
         dNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800009; x=1776404809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=Furce14N/rBL6XVLjq3epDSUhQdz2KxrAB7SD0FPqzeXzAyWNBQ6p5JmNuX7thGwlo
         pZDD8QjwndYdzSXT2Dwk83b6VlFojd0y7HGJcmL4ZzJqzZvx1DIsBdtNkAYXAasuB1jG
         ptDs14p+o01ha/7TrYcLjYg1yjVOZutU/D/R2l9Um0GmbAEFlEH3GZXt7E3wsOIYHVGZ
         hDX5AktUShnoqQaryz9tLbsWJS9LKEvhajJN1IGR87/fLFzHIZ6MDsj6DRoLR50Sf0bj
         8VeiugpVTuDpClvWfzbPXft0hTnXUA0FV0B8JY1Q0WTMyEjc/ii1kjY9RskVAg1lP3h5
         fGGA==
X-Forwarded-Encrypted: i=1; AJvYcCVvrZ0yK5Gl2axxI2lTb+d8pRh+0W4BtCtOAUfN/C7Vzpmv3vEuquxcoC5aMKZa49YqFjVO1Aa7ySs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhizPXbO4htRfqeKX6xRloL/2JpDsP74sjd75UA+9OSXor5MVz
	SvLl//VirhbEaBKwLG1bI/+OpSU8w2X8hrMu0FqG4y2U7S9YR3cdF40HupFwfFPZ7Y6CBqQVUKu
	qBSP2f6i8AIDqcKUlKU1ztOjy9sU0ZmIAaEcERfplzkbsc9zbsL/OPxP9Ctxgwl8=
X-Gm-Gg: AeBDieu6a+xvdl76H5xFMh643+JQ0V8zpxqqysTEIUjjmW5Gi8XW/hBpKT3Su6Y8lEx
	IysEUaSwuF4OAP1Qmg3j1HaQe1Blp4RUSa9do+Fdo4n8LpZTbCssEdLqnaWQlEKuNgrzANupFsG
	L7prrF/BpjBtml2TfaVKLfyaT88Cn6ytpzmerEuxNUeKuSkXMaZHE6oc5nRe3Am35HqwGqJdqAA
	dA4QyyZnpmgSiaEejCcJD4CRF4dkTwtX+7zXrcNFX3iVRI6UxCLLITneD6bdJEwrNRa6goZD3Rf
	T8Y+dEKaiZP9g6k7EFcq7ZfjKCNrsYgrD3K4Ym2mEsT1EARvtRaluYpIDPyuKvzPhKkn+r/qGkW
	G59HuEsE7HmurPYfqlqay/jnyl64OQ9h+z9CPd03uSwA+PIVt6w==
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026754a91.24.1775800008945;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026730a91.24.1775800008479;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e16930sm14363155ad.36.2026.04.09.22.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Message-ID: <7c244d02-ebef-4a75-b1b2-f55f8ce7c8dc@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:16:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
 <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1MSBTYWx0ZWRfXy7ljmxsnMj1g
 VgW01eY557itNhQP7wnz32+ZXK2AoYy+5K+tpiYXceOl7eJMTcIP56V+uWSq5ktJ3I+G3oLLHg/
 2Gj3jWL1r7/2eKaKKmy38+EOnVwKLnClT/L6Z8yQk8USW8GDlOJ3qzAGvftNi7CEGVybwHc+hCo
 ULeHfSL4/VU9fjXSdSVGwes85yNvRgpmTSEDflH7VLuvNwqoP12Ae3QC3Kzukz40hc9fFniwYmE
 fxYt5oPBij1+EwJf7KiNN1JUsRDY/p7ZdbVJY8iBbghCqh92XUs1fHsEWVt5WBexM9fGWXsCbIA
 MsG4ueZ2UkN1RXa9FasK578NYFWV4i+V2Y0XWUU+xV+oKL4sVrJRYyZBsjWjUAjX1+lLAjc+LTp
 iJYYogWu9FF1LBCjqOZv+ZeQSt7jQSltJ/t2wc7SesxwVfXbg4lUDBpYGMJyGplDiHqaXXcxQoA
 nJ7Sd4VANRALtpxG46A==
X-Proofpoint-GUID: -EmSlXLKBdLU4MLKyzMZpFwWNePrWOBa
X-Proofpoint-ORIG-GUID: -EmSlXLKBdLU4MLKyzMZpFwWNePrWOBa
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d88ec9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=xLwlGchuUDJACbqrD4cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100051



On 4/10/2026 10:18 AM, Jie Gan wrote:
>> +    depends on ARM64 || COMPILE_TEST
>> +    select CLK_GLYMUR_GCC
> 
> Hi,
> 
> My bot found a [BUG] here, please ignore it if it's a false positive issue.
> 
> CLK_ELIZA_VIDEOCC selects CLK_GLYMUR_GCC instead of CLK_ELIZA_GCC
> 
> - select CLK_GLYMUR_GCC pulls in gcc-glymur.c instead of gcc-eliza.c
> - On an Eliza system, gcc-glymur.c will never probe (no matching DTS
> node), so GCC_VIDEO_AHB_CLK from the Eliza GCC will never be available
> to videocc
> - The videocc driver's clocks = <&gcc GCC_VIDEO_AHB_CLK> will fail to
> resolve at runtime
> - The correct fix is select CLK_ELIZA_GCC, consistent with all other
> Eliza clock controllers
> 

Thanks, Jie for pointing out, will fix this.

GCC of ELIZA is already 'y' and Video driver probes as this
GCC_VIDEO_AHB_CLK is kept enabled/critical.

Please find the 'clk_summary' from device.

       bi-tcxo-div2-clk              1       1        0        19200000
  0          0     50000      Y         deviceless
no_connection_id
          video_cc_xo_clk_src        0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0_shift_clk 0       0        0        19200000
  0          0     50000      N               deviceless
     no_connection_id
             video_cc_mvs0c_shift_clk 0       0        0        19200000
   0          0     50000      N               deviceless
      no_connection_id
          video_cc_pll0              0       0        0        576000000
  0          0     50000      N            deviceless
  no_connection_id
          video_cc_mvs0_clk_src      0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0c_div2_div_clk_src 0       0        0
9600000     0          0     50000      Y               deviceless
               no_connection_id
                video_cc_mvs0c_clk   0       0        0        9600000
  0          0     50000      N                  deviceless
        no_connection_id
             video_cc_mvs0_div_clk_src 0       0        0        6400000
    0          0     50000      Y               deviceless
       no_connection_id
                video_cc_mvs0_clk    0       0        0        6400000
  0          0     50000      N                  deviceless
        no_connection_id
          video_cc_ahb_clk_src       0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id



-- 
Thanks,
Taniya Das

