Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BB37756F
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062703; cv=none; b=PhH461qlN4inPUbMOIkXqmiI2vbDwLGVo2SAu6ORGVnrZgqZvyKOHn1T17VqAn7QssnsaJ6buOcr2lx9ZsLogvHx6tAgqfXYNABZZikSIX1XB+JxazQ0dXIsMc6b6RcanlSi4iL/kRbquWQiKlkTyXTCYWG6nhV5PGwe9lhAbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062703; c=relaxed/simple;
	bh=nrXTpxV8sNkGJrT4dxWYKlXe93h3GEQTCy4NeH6xDXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ7MKg9wZhM5mIpS12znXzr5BmiFuRW5AqJnqyJam7STlKIsuZTrazdab8xjdWDb1JRNBABrtFLOUv+YBrx5DjdkZ00VxPsybJmtXORi7MLKb4sUxVb87s9LjyABt0vO8hLRg/XTxqx839e91BrOalC3fyAB8luXzguN6coslFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTvYnH/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGfMCgvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTvYnH/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGfMCgvf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rogZ3108984
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMPwHUTg1hOJ3+DDxHnE1QSlEaPxseIJLLS6opdgGNs=; b=MTvYnH/5k9JYMr2m
	qTN7JGPcwNpy9jnDlHxJIMhH6dpKWgQGFBnWTElNlMtrkRjcZjhXrkPfqe0l0iPi
	RNOU3xSTsBJcCP+GVT5GSldDP08Ls81eqrvdpQjpGoHIdcKRsX7p3Qq1IyVYFxtE
	6adE6PRzi4n1mgMZhJ8HH76+4VmDq8wEZrog3c/8yOL495XgQa4w0UUW8zZBhqHI
	N5YA71MDorPwo6iQtbYy9CHj6bhxo7ZbRhr41GJcGWZ8myPYtamrD7z9t7x1vu/I
	lpHjULpVbRP4imjmycaC2PWqF3GE14NUt1oPB1w9seqMCqE6UKUJBE9/Q7rlY9ec
	NFFv6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey9tjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:11:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cbeb53so5671585a.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062701; x=1783667501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMPwHUTg1hOJ3+DDxHnE1QSlEaPxseIJLLS6opdgGNs=;
        b=EGfMCgvfZErmykzBMbgBH6Cn7XrxnD32Q0JeN7hpW5zBo7bCRu9o53Hy6HAjGNqUyb
         yzALifwGWfh6BAGxEPgAiLC4CRoQ1xVeUGU8lQKczx+KtGLJY5OdNm52l99QeanXxlkS
         MFms216yQZoT6xwhDAE6aeDGC5jy1p5RTLyNCDPWQcDaq5zgpPdYuon7IiSOgoEHewSl
         BA1IoYbJAE5t6xf6KTOnyqKL3GREw0s5x9iz2SIBbLKTJYGflCFkZREe1qCy/mOBhz2Q
         XPM9a69dASeQYGH4ppVCOx+d5tvndwwq8aHZAi4LvXvQthe+WuD4+Y/fX+OTAm6NgmLJ
         EhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062701; x=1783667501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMPwHUTg1hOJ3+DDxHnE1QSlEaPxseIJLLS6opdgGNs=;
        b=n1Fll3tWyJ4GHi3waqQ5Y31fc+y8kjaRZUdtvZ/sH7JTt0jjwusiLGziQI9OVwuIxD
         6u4ja3Xn9x09Oif5L3Qvf3NEy3y1jdUp7+gP4ivtgVwwUveEv+3RtXG8TikUUKoqzR5W
         siroNmTQ0zAvgeQmHykqDqZZVuoedIvBJUpTQRCg7GNrw7FVWT7YNoKqrt2MPTRO10cb
         dDUKxTKDnhHHAObBZ+5adSi5ZrT7H9ZaqRwtg0U0ZlMOU9SWU1P8omOa6yNhO6M2uSqe
         Od2n4rAH9E7EtCGgrg0iknsiRiAq1cfb/uBl8Qz6jqz7LYTBDxkTEZiSyxVgLSxs9AXa
         ntKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NPAkAtet070cwl+DTlDZM9depRbbTs0rd+aeCNV6IL70rNRu1yVE6T6jAne60H1/+WBle2bL1Emo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtm1xscoBEU3qIxJ3lfESXBp+2BdGv22G1Ee1X1ZMAi+mUMd9a
	aaZK/eKhYdBV6jdyZt7LDd8XeMj/jHQXa6/s5iYxW7IRU7gV38NAsVAvUsyG843TbhwyJPIyH6I
	sI4NHfnbwB9xBtzGzx3cyIquyE2CzewwaOB8sVBbacWy7bHABtz4Isq8qQeg0zis=
X-Gm-Gg: AfdE7cmolQAAKuIPHAH71+njbEzsu3/vjNqEdNpU8Zr3nMSqMs0ZGfoMbmyl1xcHD2G
	WYsKLw6jI2v9fyU4SGFK7jBIBQ6lnH5tpx5d+ocDXgIkOOMnjSKQDhBgUAGTdyevrNrkIeUEbON
	K8M5bCbElMmp+VUcJ9tbOL0SRgmbw73vED8vSNGFB75f152XceI0CjEHJs5ASNa+nDgVxAukV8+
	KazBkDWkeZf2L6hc8vXH6FxkbeONbtvUk7MGSBRwv+Uh+TBgd+t4foZ3ZM8mKwzHYLtxowgvt0+
	94ds5i+qHz82Dtch17MzX6LF6JRk1aTEaU3/PMab8KUXoAepjLIHfpRcCkZE624uBwEapiHbgHa
	KciFtD2eMB1xqO6lMJ8I5tFm7i3pp6TYwnT4=
X-Received: by 2002:ac8:7d56:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c26b505c0mr74007801cf.11.1783062700693;
        Fri, 03 Jul 2026 00:11:40 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c26b505c0mr74007491cf.11.1783062700217;
        Fri, 03 Jul 2026 00:11:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c6f3dsm234829066b.52.2026.07.03.00.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:11:39 -0700 (PDT)
Message-ID: <578fd547-4ea2-4e9a-be90-dc765e449da8@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX77a912KqkVwg
 iWX/TFhhU1rXmiBLrkLSpDtIa1iP2A3En6lQ8dwhKmmgSEFyk+O0rtbn8B+PcnP8JnohgNokTnO
 2j5GtHxbiMWhb2DrUMTZkqaqL5hOLNd9v77gy27WOVD5Vc5rEdeglBaJXKxeKxild/TUbivp7Ra
 sItDFKdugKj/HshGFm4FlN/RIIPmqwvjh4Psx4zgJz/XXT+baptvzFq3aKckRYqlBQsqJ9FACUz
 0AwzHRtZwLHLEhzInaehLSvjIY20PvvUaMcakt9iB4q+D+hvsK3/7t2ZLBbvQmUvQS8QNUKq+dG
 YyVZZch0vzxtytp2m208mVSTa/6RpANfMcLUtT1ActDwXb7WKgDevUugky2ekaDGKkWvlsEGyLJ
 +XlR4Esx71acn1ivMYH3nQo7kBpE88+vMKItvQ4WXFUttuQIdllZsFAlts85pYFK1sa23rNB1jJ
 sh1dAgiDvgi2iK50hrA==
X-Proofpoint-GUID: 9QuelbkMrK8LJIUktLmelScR6Ppy5QJc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX5LoTTd8PSOy8
 7pgbVEzhQ7hsEmX7z3nLNoF62RcXDFHV835QN87ISSVJSESahJpVIv1A0dHm/eUTpiu7EkfIYIz
 X3pelue+WcaDs42tkRYSZnikqIslJmg=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4760ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9QuelbkMrK8LJIUktLmelScR6Ppy5QJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030066

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
