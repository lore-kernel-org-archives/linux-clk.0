Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873781;
	b=hfr/n8JsbbnZuADxv5YDnxS87lUYkkZieDMSGrm30axjxGfPRbeAwBS+yTNXtu+jKmKY
	 lxVPEItZX6LWPHlXqRf4LDBig2fYhF3ph3WbJW6cf2f6zS7xY22CTw0G302k+7sokqjMd
	 QXlcQwMUx0Con4+9VQGC6rSP+hupEQgJchKX+DyNr6fMZpz0Rw0oAW/5WMLMQZV9r7RHk
	 cImYSG0Vp/ZIAi35+30TZnGuqpVhzcY+5xerMzETiFbxkFTjmo2JLsA6Fs7VsX/dhVyO/
	 +tEfTb8LCDpHzSAUjhO+m9UckRE6urC2nRtgrOFt/wq1stzNFv7SobmZNtkQkwS1S6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
	b=ZHzHVYHduMz2XOUZMoMvP8Gt0xFfJRVsmhgNwgMUPCL8eZxAt5ggsqU5OmEKkC0ikl3L
	 5Hd09kq9n0Ye4Sv/si87Yni98jYPlhM7Oj3/0BwezZAR14TBRoQpj/AdJhOq9vIZNI1cj
	 bWtFaSJNMIVph+WFQB21KYEyEdXfVd7ohbwxMCDL9Vp7z9XZq4Hec0aqTlqF9pBoasEEU
	 DPWmzQLx77id1j6nVFaGSZT1JSyS6wJFPLdKZJCkxektKNO0MGwJ0AziIZxW634J5Jca5
	 jEccVvWjz5p/mOjGk6a54RJRHnXjH8lHG70hs0ZIcnKs0sLSYoXihQEJIVBV8HxBfiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dm/rrgvG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsO7qFz2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA5606A32C
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BA5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dm/rrgvG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsO7qFz2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tcnH3044081
	for <linux-clk@vger.kernel.org>; Thu, 5 Nov 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=; b=Dm/rrgvGMH4DSLSF
	Nlir3zx3307J6xCw3fCd9n1NIa/n+sLVK18mfBvjQQ12WDY1TY8woRYsmKtFANu8
	7MRIZ4Tz65xAnOlFyf+eArVvFLG5fkuTUe4jRioo5pT653Gka47VkWXjzJ+cr9n/
	6cX/wN991s4mWBns3uQmTzajy4nkPOHEFbngA49gNM7HiLmf6kmbm4tlvWVRFeq5
	isxxeI+cppMuKbblwHKSfp+/d6XVRIXD5BPs1UL0Uy8KOVadfVvpqJEggA+H1XFV
	2IFhLuH8yFyPdQ4boXhOd0hJxgIQtb5AxMxhmhOFXJ7C7gwKkP3RfNZ2KAPdj9SP
	4H+jkQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89suyba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 10:16:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1143260eec.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873780; x=1794478580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=SsO7qFz2tz9dgth4FHcGwJ4CNlsPXqS4tYpy6Tuv2eqnxGQNNF6OBsr998YZgzh6LJ
         lYSasC8Xvz4N7AVjogVkLqCDgx9wJzFX1qKdK6V7yIiTgCBF08moxUNRz75zlDoujFoj
         eeI4ImQBgFG3TAK0++UYg9IvBh6rEH9zWqtv2e+e0d0acv1ZZ8znk+WV2yBTB6xkehiR
         PLwkAcFWdPGdqxN9op7BWnSg0OVB0UcL8/GoNuQDv12aROtobiRkx/5eivnZEeouWmFS
         6r/3b6kluqHripQcao1Ww0+5LSyYxFScEHYiiICSWSfrWYS/h6iD7XgcQDhDJHIOQhyr
         7v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873780; x=1794478580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=0HVmtJEggUPt5MRFte2vnZqNP+wk5IVvxQQpvsqYLrpvzvT1RPoDgTJ2wZGneh32oc
         fELTMSduHwP14eTv7nclnqLuNEzT4PbD8BQZvCJmtiRjPDuLqkyby6bZoprhDsfD3MT4
         wKV0hVoaYMLJo7bRbQBm9zNM+jN/OOzzEnVmR9VowSs5sgS/AYn5g/F1enouXeDF6+G0
         YxkUhNogre/7wcw6Gt8xkeGAftcYqhQj5fMYEA8jVVp4v8kja+RmAQO6af6NiGrPabjf
         tGTTmAbvdGCuraIbc2qlM1CgWtzd/1zNcd5EKiKuPlE39no2a9d5ButL07GsN+EZiGz3
         7IMg==
X-Forwarded-Encrypted: i=1; AKwUvByhn5Q55nB0v/9pv+6cPLrdMECzpOq3k/pSMKfG1d4yje4Fusimxq3JYmzvwfvYe6uCREU6qDhij1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UA53yWvvAi2yXBI0s9lQKZFTqQ+JXbCDarZP7JqT1r1W0eXnL
	VhLZem7pchUKyVDzM/87xZJOFiyL8JrsVUcA5C3HDFkbKXurv/9ePvroH76WsueJm8DHh3YCbM9
	O6vf8tarL5vPBLctdObt1oXZSw9xaNhBztvP+gPunHUcoQhvjGYxGwBvf/C1vy59+EbiY1AE=
X-Gm-Gg: AYBFou0xUCOpXTzzhVEkhSuMKAHMk4h8NpaMu4ImuvIzeoyZ6sKYaHCAP6UsvkNQ9mp
	lHJrFoJK/ZVLPs3N1ud3XtOFG5tHw2msdbzmJ4Xs29Bz3i05+qb5hPdmWDhJuhJ8w3hINPuNJL4
	CAVLoEsT4il/GLy0OG57vlr2YC9w72/inlNwnUZaHnTKlNXpdYmssa1r4Gry+/D0jVyOku8fRKt
	18SGyNspUWcrLDwsdFjFQM3OicXnWwf6tqrW6xmxdptz4WtsoLb8wyJmLAu9Epj9y+sMIKZG8L2
	3Tz/hRLehWHxJmQqe8+bcMSD1YowcCkB9XoSTE3Mj7XQwIZoNwQdCn0zYCMNjSvv8STdFCgGa91
	S9M61T6kWQgNVHYwv/NHJ9cPQgV9RRcE23WcUngBNgazyLfDC4TlR2bGzPVlU/YarXy+NRhgztn
	2x
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5355029eec.13.1793873779417;
        Thu, 05 Nov 2026 02:16:19 -0800 (PST)
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5354978eec.13.1793873778588;
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17792403eec.16.2026.11.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Message-ID: <e07bf018-9a3b-4b2c-aa2d-32bb3a8db60d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:46:09 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GHcl5cVzylv_9Qxi9TjUEwr7bNAjfqwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfXyXQM8kNge0Oa
 9MLYy+TqYQ3D5eS1/pAJQvsz4dWOoPwuFsGb12pF3uZF5if5qwwxuZpagQMWd1cfe8btOzBuxdi
 JDScYL3tHp/0oajmaS/bVdsKSM5LvXBeFC3VzabY760XdK8hU0VC8WntxvTkfQaEwtr5UM/8pYq
 ggHRrNcwNx7lXvLvAk8iEPbgbEuDJv4mCfpfNuHba1qVFYJcSNsWwcsy3mUZYynwrlJ+XS61D6Z
 OnmfeLMMm9vqpUdSRqmfMnaZTmjULdB1FDUSuA9mxC3CHSEXqFdgrlt2AEDekyIhUivzgdD5HoG
 4cxK0mZphtT2cr5LbVfwkZbkaMxuBoH5lYhT+Hrdo2B+dR7SQ1912YybaakG3gXw3bB2jxUXv8w
 AfTbaFoJlOQv8qhfGZ2z3rVg9b41Rf/yJbTN811+2isBUoFHycBXAgUBs0cS5c0ndOdY97XSq8W
 yaswY1yrsYUL51X+ZmQ==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec5774 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=D307_pyVuiG9t-qGCPMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: GHcl5cVzylv_9Qxi9TjUEwr7bNAjfqwT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX1kiS7Q8PDKN3
 RQJEMYIWZ20rwqB6Cx17E6oQEHMRIBRL6gb3iCHBjE/9R0JCmT9JOHnAuK7YrJ+psS/LOJ1IbNc
 s1ac7M/EFpTBhoi+edQ/SLHk6QU42ro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050040



On 11/2/2026 9:24 PM, Dmitry Baryshkov wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
> What was the first chip where these registers appeared? Was it present
> on SDM845?


It is available, but we didn't enable or tested the block on SDM845.

-- 
Thanks,
Taniya Das

