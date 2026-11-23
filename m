Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447268;
	b=QOpY0O2Z/zeLPvk5+FVHS9OAU0BctbRCOIOZNxKOs0U72IiAaKshoxm9PudIL1EWTere
	 Qc2vn3jurxj2tLrv1oFP9YNhPUr5RzrwvxaYUcsWbIHGu0n7h/l7EyfLZPyFW403nCzND
	 QoFRHeAbtOvdL78mAjOPZCoudEJJJ+dvuIQLJyo0SlgI2yKrC1bbwAJfseIHyTfzhXl8I
	 QgWp9z6Rw+5g81gQFeKwpG4dpc+HpuXXEDQ1M2jHfLDBc+NzJsw8jKfcMQQ5LrpBuLfEV
	 jPkt+5NgKRx+hK2YwX18Yd/ch2mnvKyCSu2Vzr141sZrkPnTMo6JdNiYtixKlraHrfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
	b=UiNHrdmPCkuGCojBtRzaF5mr4JYmKhF7/cmmJjQ0GLHR8nVEiN5urYoVf/2fzV+vWXDE
	 /hwGaqPyEWh/diWKz6WoAkSCcCs9BcIN6Td7DAHA+CGs7srFcvraHrrK8gNLmSsCmOmZc
	 /GNRp3byQQ+48bsYhPFZOF0QwDIj3jx3jQiMyiEVg46cklnwHZ0V58EF1kslgJcQaMMN/
	 0GN7tiaSNlMMNPU3eOzzW/db/uAm/QflyUf9dC6YPDKmXKQMYzb1qxCm/7xISGnl1A1G+
	 wXHuE2I445srH5RYJIZAqK5NrvU7htuf/w1xrtiCHPD6yPGQ+Dqqf9Tk5Aa1gTsIKTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06208606A327
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06208606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0q03072381
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=; b=Z7rhCiUm1Yg2sudi
	2PFkyr/8G2GSQ4Rw42s2N0EEBhXHuCXgraAr7/chrPArc6k1xjUap6408kqVKf8N
	bZmucUTooXeXiCaPET0e12DVrfdO+xM8CgT/1uA8Bin/+lX78MeuOTgU+tX3BKnp
	woRsr0MVaNFnKlf7+OcaJBEib5dlY3RC/Rv1UAt+imNWfpbObrT5lmFCrSQnUdRW
	kmb4qRTCQfdSm36xiRHDrKC0672pJn4zNknHviC4l2oryid8EkVfEG7o4ClqcCRz
	lC9GUrpy26uwxg1m01uZ8hO04kt4DVwCWiWqGiOXcH0etGd7/o8pRRX2YObIi1x9
	nudJaQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7snke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:21:06 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-567c8af65f1so173414b6e.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447266; x=1796052066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=d6ZxGWPiqbNxaw5lhbK8DQAGemnqRRPIeiJ5GTZcv+h8E1sgfkr63clTz64Zvng/nv
         BcU2LCU3DHOgPxBzvwFhS9mNzBYK48KoLOPFDlK15SQjuh9Y3bRsL2tR1w5kHsCzSd0G
         DsPF5MTaMNcEXn1DHS21SlpgGI97M5E3BmkX1UYBuOOYWZSrLOyj3a11Djc5kAhWwVSm
         6CjyTgvp+JkZDHOj8GeS1fSy9YSoHauHUZkuv05R7lOK8NoNDSLmQJFdnb1Js0cE12gy
         d4HDPQVgM6jIP6sPFlGSX2YNpKTpwonSI5a4Qo+yhY8LL+zTh9emHltPxqhf2fuuJxvi
         esrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447266; x=1796052066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=JyY5dvboN9wNoD9l2RzJ4fmKl0mwIF8rRSoVW/ooex0cR4kAc8t7Os908M5og+JB8q
         WCw1Lzpy3rWoK7XmGmgwRDf+DJTfyUB8aTSlc0CirhlR6eibPyWU77kzZ7KVsmQmJz50
         vJlZf+vqYTEQNGokgvOAQhVHcmzgOUGO7RyaSFHpvQJvywHp/kM02ALnbvtFsFreSrAE
         Gx2WWu8kF3AQPuomkKSu6nZ85l5qpG/5+67NJSsP987OyMIZAO8TBmzo2Ndiy3+Pdftc
         31xSYP+qRDAFmxfJqvbGpkvSqETg+B0cK90RC+ltQU7UlxNLl0qLKAC0ZcAu2YQNzzNx
         pETw==
X-Forwarded-Encrypted: i=1; AL+hErEd3IdRp6zi+5EY32CZu5kEuCbdwOig0b0eqnJnE0+B3XA+APvc1CEPAWsThABZe9az3PWF/NdyGMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ecmv+psVKb56LiRvSF56Q22R0jRbJqSiIQSgFdBEu+9px5Gde
	o9WLREq5QSB0vfNlNmrEUKPfdXEeDEHZHgCil1ByPSFQgeJGKHBd9uv8o4nw+wcUd/G5TfFSHas
	CvCtrP7WT+T79Ex5jGjPcTAR8GrB6PzIU+D8API6Ot4YveNz8vkpN53iD/dSOuoU=
X-Gm-Gg: AZFdTZdpbrCGJEp75TKixCAF5UEGr5+kl6ggv3A+Fo8m/4J4NZj/P50YC5HZidfwDJO
	/MroJUPV+3uZT5EK08ooW+ZO7yYSHcvFN4bEazauyaf+5WiqCHLWE9n2ulglkZFFX+4BgxvR+hG
	CaXnK6U7GidjViLRakrYJhVZ4EWP/ocNVRzaOYE/85Fi92Gpc5BRJ7T9DmbK+hLRuZlYVMwHxOL
	XQi3lQVB9IUJoS/pOqY5PImaw1xxwsmhSSX6I4dfKJaWpgq9In7iE+wZ+oZcdHoJURyNXlyCHWB
	boXtZ2J4jsL6PKTeX/0JOQz1JZ5AdQRvdqf+j8v8M0EI50sDG03NKw6qAvoUe3LpZJxSjM5C3By
	QDxEhoIHVmeYJqPg7qdq8zQc1LPU24mC7UGHHa6z7REBnn/Iisu11ruFpI7GDiucKWJ184Nc=
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194558b6e.1.1795447266169;
        Mon, 23 Nov 2026 07:21:06 -0800 (PST)
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194509b6e.1.1795447265752;
        Mon, 23 Nov 2026 07:21:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm5375497a12.33.2026.11.23.07.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:21:04 -0800 (PST)
Message-ID: <646c17cd-aded-46dd-874b-dbe7ae0f4a1d@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:21:01 +0100
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0459e2 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GtvZotVShuh0uySl3soA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX8tnO7Mpai4tj
 fXDa6PXDxtj3z2GhRF4xQFQf2pq2/dx1K8XW/J6Rj4ltFMgGwFUPNCR9/mx1suF98DqEXA9Hdi1
 kNWx0dvMGW5RHhmY3YNie7jMkuFyNT7CQv576ElbzvC1l/FWob6BPQih+aebcNLjH9EOCWuZ5In
 viUqwbsRARkglMjyt05v4HOZKdb0C9PfoWdkGcURc4tRHc8libgLfmDoFjcCuQuIMy9tn50pRbU
 J0GEp6GicZi5xR94g/8F/RQihYKBNgVWYSR9ut9LQ1wh8D1uniQnciUTwLapijvbxi6oir3f9Fb
 VD/uUF2MfrXWDKDNKDU+lPSylIhqqAKTAP55C+5jwPXG09N6DesprSDhPz41KBS2Os65DLcVJVR
 3NHOqbQDwNIF0GQwcMLsMDa+VGIgVQhpXCSl5s8C7P78MrRWYKZlAhcH+0YKiRDCaXzNQSuT/i0
 xSTf9jymA0AtJbRAlbg==
X-Proofpoint-GUID: rmdNzW_wOYlWixKQI7ZV3lEc5ZF5xn1z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXwZefNkaczQaI
 3K/1hk4USBgFaXIBh4F2s38ls+0x1Hiq9l7IdZi7MtqB7exiQCI9Gk70KhXAlXeCzC5ijlEt7Ss
 zFFL0uS6egPSIkQNjnml6BPMEPUuS0c=
X-Proofpoint-ORIG-GUID: rmdNzW_wOYlWixKQI7ZV3lEc5ZF5xn1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/16/26 6:27 AM, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
