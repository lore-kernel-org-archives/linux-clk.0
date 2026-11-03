Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699732;
	b=mdaQrwfvHNSr+U57YbXoapoE6afnPY+dvDMnZ07JAT4Mbcd+qz+uPqnAXoSf+Q7mSJMU
	 CVt3lnl/9xlEbtPoURSeANvq8JkWGXrU4/of2BZrZXcxEgrVDY1e1lJCsXC64m5jUXq6F
	 iknZBYk+cr2WCtfoKLl//V7RmlzAhNewVUtjlkROn+KrBRixVg6Uk502ThzJK2wPIwDYL
	 51zbwEMBCvasCoK58/G2qQpzMr8kOd78C2BZRQ8d6GLfSJi1MPrfFl9wYKgo7OVrY5mQn
	 udJkzrPt7vjRGR41byI76H/94dHJdoNWQvSyckS3MKvoBnGCAImGZ6BszXbNxl74FyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
	b=e8nPZ+Ui29GFGnXRgSHCpO04861PqppzMKS/WiVfG2C7vinTJi3zsAAqtPIf+4wmgp5p
	 EExZusE9snBAoeyzvellaJwhttYs2NA4LxphBmhAtKTwUQTsDBJmjjlMPzkaHDOpX9oT7
	 QyJ244bE8IfOoSMjuCisAKNGFbJwadXbovjozLpZnPoqp5+omE697CAg8wERH4Ac3rzs3
	 cdv7Q/RLl/fBl/iv3W4KANIPrnE5AcSgzXn0WNlvk0u72TyiBKGAINQhk2gnBHxXlLsDb
	 4pxqUfPQp7qymFyI7V7J0QI5hkeYh7GNdAO6OgxMBAA0tPTuZHLd7RQetOAttBwNAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2660A5BD5
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C2660A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34h6aV750922
	for <linux-clk@vger.kernel.org>; Tue, 3 Nov 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXjhq80fJFnA95T4d1bBkkRW
	6z+GaA4781tkMP0d2VA=; b=glhrtAHhzZLRW+IrXafw84382U0f16rTqbiYh4Vi
	7+Sf/7CsEBqESU6eeIHRCPw/ONkAz8mYPo4gx2DCW9rLkzxiYRROihFQlNpEMffc
	hUAYscpA/6kXrZ7stvW5lVYHR0sd0IUbt8WX8gaqyth3dB9IHiwy1Z0syKzU0IvN
	EmoICur/+6RJGX9LhsXhlDM8QT67Yuqkhaw7arPd/H1iQ5JltRZMgABJoos+hNJ8
	WGWW1ZqNP2iZHZND0eS5t+IYKVi70TIGkH9dulJcS+5wdwaaBmpi+y6+qB24A4C4
	/r3iNfBwUI3DEEh4jV1CWr4YmpNZGy8lnQ0ahSOiNb5TXQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5h6c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:55:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b86c66e5so393012241.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699730; x=1794304530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=Ty7n23cr7OYmfDt+wk+54hQv28oea+opR1DYhddK155zuu9PX/BylhjCEKxfDOIYjR
         g5Ia1gxe/vFsIDf3epARfppXirgRu686Jc+GG845sU4yW1WUA76qHw1sMKv4JfFvWZ50
         5S7gx4oNzEa/jaC98UJN45AgzY3yp3j0LOIJlpN/alTBOOBK9gf+ruqI27HVLzV3LxY9
         YZhoEQRDsZWwup5RTeBPelfvmI8fgCF0e5XfFmhL12zi52UUuiFZBSItEvAkY4f3Qt+U
         wVcwYwbrIDMdXVJvu72wslJfeMIDSnYoKdzh1rXTMWiIorld6WLS2xUPI/nI20h79+dQ
         HAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699730; x=1794304530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=x0/WF0GokKGmyhbL5n6ZwQIR1Ik+eFukpH85AhxpalmgT2Me5C38OBwwGbr1kX5J5d
         4p+k6cqnQukGO3M2Rh4IXxeChwx41O+6O5JUUH3CHbGw5ByLPAUVrUjJOtVmv7SQTSKl
         OIMvuKWvmg7BhTna4xbt+TAy9E6tD9oZCtWeHKP7EcWdi2E9T0q/UlSd2rdEEB1lzZzq
         /d4jALzOK99HCTEh+9EaWHKlzqYlOX5dwnPTZlWF/4Zjgw8vbTJ1bMsXUF7Z181iuEDD
         TkmlpY9Eft4eEMbwUNarkHYa0HP/7l6tqHMb1AM1oQ8COq3HQx04mRSA59eMsFpwDGEh
         Yu9A==
X-Forwarded-Encrypted: i=1; AKwUvBxCn86a6rOAjQoDg4DH8/2k+IhQdyuQbuct1rK2IqBdMWwFbvvmJdxf9WLcOZlsUgzPkL8yYmO1Ce8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yH77+ouNrZo04upciMXZvj5Vj1ZkxrzcKztXgZ+FBbA/3KfxR
	aEcsVx0BJ6u7rNu9w1nBh68T+I/GEinpmjobO9J6gxAiQm33BzTnVdh2XrH+icQVqXIbWc93iBZ
	KEyBbUtKMb8Zygx19UxLBjNi2VBQ0WbCOS2MTYS9Kg436Szlj7Czt1xVEgv0A66E=
X-Gm-Gg: AYBFou1IEMXmbeAuFgVGms/5ro9bvfEdTVtaN+21/T64SCH58u3+3MGqkA+NyeIny3R
	j4dDg4btJ8xbLiJ8SmWi9WQULTU/9Sx9VNZLLaEtwGTmgPljtfV3BMr4CVCHQyjFhU53OF0hb/7
	Mba90RUn/Cg4pXji5m3lfcngP9smJlS6scdlxsaVrjBmVXarzn7NIqYwhF/6v/9JhVMjxR59FpW
	/rfzQCbWkxn8YF61LJ3Lbr8YX9n3MU3vD91VEFye7MdfYNs+KWgMRw/pQriCJjdu6vefycSXg5x
	ocI8UfT5KmiB0/li7irm/omX5XhTtQKiko2t+Ol8gttjhAou+yzOyP4boYI9lqIJcVMtAqBKtmM
	O/Yr0Vb+pkAYq8nQf7amVKwa0O4qDJsCF9DVaJYcB149few7zL00ahJFcflvd3bg=
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873292137.28.1793699729876;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873269137.28.1793699729142;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm23166849f8f.56.2026.11.03.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:55:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:55:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
Message-ID: <k3pobjkp4kzshfftvszrzc2jfdezsd7hauzzbhi72gfmyisyji@a67eggd7tvxk>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Proofpoint-GUID: uySwOcQWfReEOR-AfPFJIvgj8I1P30yq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX0CIUqw+CVERL
 b6K9hPBem7MgWCFZQtRYjjohkTboqF7a8Vcoll6wTZqXxuF7zdN9LjKh+5Y7u4ZXVW9OlDFd4mw
 ur2KIpHvU/TA0htXG0wmwcQlIii/JU8=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9af92 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aa2JovKfeZIn8VmDcRQA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: uySwOcQWfReEOR-AfPFJIvgj8I1P30yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX6csQSBG8ruO3
 1TprJnRFx9jNMELpaoorMUBzTK6rgXzr8Kb0yoxYlyLm4t6R4m+PzJktqKq1zvN3cuOjbK2vfGY
 hKu6nOLG+Gej/ipH3SGTYw0d2lhebQgSkmpTkdufiAHCx9TbME7yVBlMh2Y2tY9kIfSD43lrgla
 gfPYOSO9h8vwxiBOHNWiUmIyZgxTnqTr+4oH6FtgjW4nnMXXaY2zvP1hK4fBSCuGtwRIWvpFAgE
 GYBfo7/vDY6DTMUs/dx0QevPFRfAzEKKVLRJjbK4dr6mwVYSYeoRqOQnoDbtlcyra56V5fMCrVn
 oh82ATtphXcWy/HpbwtWAC19WzuxIno3tNS6kH/SCPXOQfWXC9bXi8sLeinOwo9OfiD9DpqCoCV
 BkOs8fuDoKhOHNr1XORZsetIBRhZu+yQMEry6enuoagBewzneJu1HmZFfuZtdKtXTc75Z5zCoe3
 b8+IdFDaDY9Mhm3cTOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-10-27 23:38:26, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
