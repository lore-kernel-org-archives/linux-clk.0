Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150A83E51DE
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887993; cv=none; b=n7KGZx1BoNpDOD19mdxJ1eAEb9bw0TvlmcGLwlE0wAOkNS1fBkdJx39hsq5GpWPw/EMrpEneRUcdoJ7+KTy5/eiXB6U8fntMovkSXngp7RynY4chGaTD4X7eOchgewN7/jnbY5JpOoapPWpB2VqYlr7SslI7z83J3evPFsLMQcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887993; c=relaxed/simple;
	bh=B1N4qNzJkPnYUi9FXjghrB4JZoPmIHc+q5v4wRfExDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXOE6hSPKD7P3d0sTjd/iK6xpSs2YgEWS66ErADg6UX3uyzZJKni+xG7V3FAfRh/kUb5oomIyDcYbJps5DWHUXM4QzJQabGV8q9mTrf1etjMVGSDu2ydJFdCR24mlFaYUEPlXvViK0HXjEM6aAI1xwmOqZMOpovI5Dp+3pEzXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS6ANKAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsyWw6UL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS6ANKAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsyWw6UL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lV871510165
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=; b=jS6ANKAKLoEElzbP
	qePk68ka4Ec1SF5wzii1TpVeycOQIN3sAWujKfIH5u9coK6EEDxHTJBIKlnRrbcB
	mrRnUQwvb85V+yUuqfzR+jeZq1H14Mx8o+39UgtgZ4QYQVBeWVKc13ylqbLhu10S
	9kSn7PSMQnGz31IuFEHVaA+7HTT1aRD2PXNhqnN+aUohIZlNXXrvDxVFFZWpvKcW
	l1b1c9pBQlWxQNL56yXz+7Hp+4f8ENmKAs3pgWfy7pZ9t1Zd1DFqw4+0IhbEWw6J
	0ws4Pc13AcqsugrEHyatxJ3mZ0kj0UTh7DRT+muqcrfhH8efV5jr0i7au9ODTAhC
	dgHSog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrt5jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so525231cf.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887990; x=1785492790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=;
        b=TsyWw6ULfxC1Rs9mqFd8WBXdHbhqCsn52uiXG/yGoNz6dN0/ezJR6MZjVEn14YArwO
         YjK8Ay34NfXYnxMaZWSP3/JWd7yNBBRFxL4EG/OD87Tp6z2Y7na7MUTpI5hmX57zzrkx
         WJiWhpa8+wDqKOygBgbVdUC4eRvqniwtqErjUaFNCItbE+fSYCf/9gxrh18E8esKnK9L
         j6kJFVfe4HZht521WKLnYUfpxkX4psRD3vJddfVUKCxu7A0Pz9/2brS+e1x8uSJFG87+
         Ya9OXD7o56sKJaVLhxCdCMgYyg1x+ebhQYkVhO3aIWHQMquIQ+YmfugVlZdWF7L7kieT
         5OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887990; x=1785492790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=;
        b=nPyNy9vEn5DXHTcdy4Vclz4VaphzQBMu7Dt2mkraCY4MoIcfbn9Cjk86S8yiCIenU7
         n4xmP3lYeKWh9XKKsw2YpzVuZ0BwEHfb5EBcvEaxwzbAmiQIgEp6UIFUDTCEUWxLRSmn
         JZPsUWSr76TAColYOW0xx6B+0oJxLDSFfnu1vt3XBKQP7AGLk/9pxErubl6/4/LpAE+f
         HrL4w7kQaiUIPrvqKSxMf9dkcl0qNWIoysEoJ2YDlqHuAvIIBg+DuhxcJ9cd0cv8gMfQ
         VNU102j+KfBe8SjbuK5wpiSSjSOQJ0JxLscJRQkw1/9LZ9H4k+RPRSkED5s0Nx8+wtKR
         7J5g==
X-Forwarded-Encrypted: i=1; AHgh+RqtiOvVP+AhPfw7+bKL63LU0fLzJRAlof+Qq5kmknTACNsgvl/N3yh5F4UeuBQhbw6XtgY0DwntI7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbYTWj4/+uzw+0bp4kA2BOwSegZk4JfYJjGtoLKAJR027+xhg
	fM+HvW19gweGKiRPPOlAvSmi9rb4iPT2Ot30vhwzIyjETfzo5KUMNlez+T0jOr6uovALPgYYNtk
	iWrNZ06mvJCsFWUlcmS5f3ECjPwO51l4St6pOIA/xH0AMKjqimLV6sk9echuZYUk=
X-Gm-Gg: AR+sD13Shz4sWKeHND4ddTh8xbCweNdSGKrajPAq+W5+PK6qu93zfE7TgW2+xDKQOZR
	o/HdcEop/QK+BCo3omNhlnszxgL01YvB5uu/iFpmf1+hZfc413ffSIFSzW4TAFkk84kLasN9sfh
	i15ACXTAR84pscv4Kf6JnFdIuZsiDv5DS/n7ia6axSi3/mwGbVn0epdx1mHO8x1GZW1B1/mMDc4
	Ydm7GCn/v+qrR8btGKINWiNb41mQFIv2SLYqpLAHQbUwigLA66MacaAuO50SkBODNuQnWrx7Kot
	aMZ4JvDl0mE44zB2GPdHwZwnKKD77s3LDUk9XNEBA/qENWFvVWEYqc+V+wZlYR/xxkeagqFM8HS
	s27BYv0F4rCfo9gIZegMG+tS/
X-Received: by 2002:a05:622a:4083:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5284972d05fmr26024141cf.5.1784887990070;
        Fri, 24 Jul 2026 03:13:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4083:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5284972d05fmr26023881cf.5.1784887989691;
        Fri, 24 Jul 2026 03:13:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1a17sm3101960a12.5.2026.07.24.03.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:13:08 -0700 (PDT)
Message-ID: <3ca51329-d84c-4c2e-94d3-71b771103584@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:13:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
 <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX8Q3K4d2hkQ8/
 mE4I7PodAzXNxym/snn+qHesAOBmwq2KYIafWfc/g3Qt50d8GJHuoSEPXO5JhaBSS8XysTFghiD
 coT2zkN1kxQdj3Tug/oy+yzosp1vs/Y=
X-Proofpoint-ORIG-GUID: Ywy5JJy7L_GBMfN_yy2Cxa2javYf14Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXyr/7COTL36ih
 kbBi5JiBq6w0dkOhBOVcI8b5FRWTSIlm78fqI8NedHR7rZJEJ3ouOXsFSkUZFf2E83zGdPwDKga
 wf+TGbjJyPUzA7PnWzeRxKZykUQ4QkaOyxIPSG06uFIzAmSLreyuoBMkKXSJza58r2C1rYwAA1Z
 z8hE8PN0rkyo67BH2/R9/YzlwtdfVflzSDKYaNodQBWQ9Ip/gF8JhuWGSdRR7Jf2NZSyk2w8661
 +wa/mKVGgQwwaW3Pfj/yWAxtcsLNvzQEa06gFC7luGQw+pH8GmQcvYuZk+8NTP5qpqVogfzIKwT
 Mpmf5TDiAMh1s+uFUDmc4TY9ttceK7p1DNnRTvZAtaUQabBX+VbB61oYLap0fPS5pwX21TyChON
 jE5MQ9cGC4REBvAFUOyIimmgXt8+AgAGL/QnXw8dqdZ6n88bIQQgoIjuw4XKo2CE1YwQhAS2o0d
 W2+r2MGO+7MeqvBFOQQ==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a633ab7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FjjYY-ANMnpf8f3CrbkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ywy5JJy7L_GBMfN_yy2Cxa2javYf14Gw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

On 7/24/26 12:10 PM, Taniya Das wrote:
> Add support for the global clock controller (GCC) on the Qualcomm Maili
> SoC by extending the Hawi global clock controller since Maili is identical
> to Hawi and has few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
