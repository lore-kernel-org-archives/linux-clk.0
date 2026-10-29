Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261740;
	b=1dsEdEZcwodOEIXxQ20HjZQSNyVJncP+VLSSS8AZiHK76lWaY5bAFebtilN/xY4maTBo
	 WFen/WQSa0sIfmX29//32ceSP/TCCUrsHxUFDVGYXMNcboLjCUytWLkBDKiRmq9OGlwid
	 5a8VLwZAngSvNI7BjPRUNBDDLdsBOlODwTCHwu11KIVfFqcxZA5/aPKuUpLIGvMCSzIx3
	 x6grotGrmy4KEdFTy+0XIxh2YUE1G1AoCG0tPukvhJR/UWOh8Pi1+slvz0l8fGyWLK43g
	 aHE3eXB1024+SgNVGvIJ/MwVXT0Vk4Z69q0I84KO+W9ixhJnMO7yEl2QsEuJtq2lksA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
	b=10gGp11WLXm1BXirPERPElLDMHog/RBmSFO1RoTf1RYW0qRV9NaGE5Ndhef83BACNCn5
	 wPnSI8N5V+aioX0C1wEqZ/mbsN9Foo1OMNMasDj/gLtq5oV4DwsfLV2Ib28SRNULXd+FG
	 yP48opzkKzHjZ11B1YUQJVd9+p3EZpuObPzsFtHKGEQYUqBZ0DZdumjeHK1i0EEoVo586
	 tvDkfk+2UQiLqFVO+zdZJp94cHmwEFcHxhhKuNHNDafEKj1VvKRq7ViN9wdqgst3g2ynk
	 5iZQGjNAaRU6oIvtZxRhAER0eMq2f4Wa0RRjjfb89qmE9AjAqTVnb8zDCFT+X1v6R8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0008606A323
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0008606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GonY3294097
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=; b=Ni51Ydx+CDpqf+Rz
	ur3Ui4ghmpDtxdRogFb9VeGwX3g6B4OUCvBJRzwpPq3ayxksQoofX/d+Q7HP/dn3
	epQDJZZYEpAKPJ9p/NdBZLbtt+6T77Rx843WiSnV6JVau5SePRAqiGy9kMtTAihl
	8Dis2v39BxC/Qxo5flms6gNprWw9RdP4Ab3Ig8BXCvSgMyVAd43sZ/YK1b3oJz3p
	kzTrsAM4rOQAV/FzJe/5EO9hAkj1UkqxXqO0VMuamegIMZH6J7C96Ru71QUlZc+j
	o7RElPMcE9Pvd/l0+xPaArwyJNevPUaoannm2KAQZBSyx+eYvowlrHe6KDDoJN6+
	aEqbqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrt9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:15:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42423885a.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261737; x=1793866537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=PkyhNcYy/3eZwUiKKPY4DINNI+7O8PhgWzTx2eO+RPRgOE4iYcoXjZj+eZ8uW5d+zO
         yrDShLjGlnccCN7iJRuXTE6x4d6wqiPm9RW/pWs+7mzKq92tBUO1CsHI7aTZEoxs7stp
         DAlrXW+8Tvf5Yk1EuVFDJIPQQdEIB+TzJ7MmUHohnattdqOuLjaczGEhwrBQ2ZL6Bch3
         m2svPhgQv79xUkLytJHaeh7wMQipk//QREZKUSQZaFn0n/WvPFQV+OqxP8/0dgoevHHe
         Rrjw4LTTFNTko/IZLSDuj4TZNL8DzBzOXpLxwlmrtlU4FG1XaWiIsYBTIapqZ2W2KQA7
         iykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261737; x=1793866537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=hqmOAL07wBn6sRDhhR3tNNzTwSspo+aFnZAxk2XIvHdIwbOmXIoi4xnzr5k/H5eNxN
         MdXrdIuIU04LARfzhTirGAK6rbqIoYJJbJUqmZJoGzvWkgLJook/nT526I7GnMpCa919
         q+YpNR54fdaZqyYD9uUVPkb5U1++OKNFlbk4JSWYBH+No3t13VXrhsnElutVTtaunj3D
         G8wtjoXFat3MZFPR+1rp8y5t6oMlGnNJIaZW46QxkoW8KSw5vM3DmPD/j4NFskjpfFKv
         Law2qbtXGUmN2CFP747soqzt4KiUKjegU/awQUcyVE9aWYXDHwqQ19rKF630Kt658Q5N
         57+A==
X-Forwarded-Encrypted: i=1; AKwUvBwLNOEqOkT90xdogKgTiQ554TDdRuBXuHuTUAJrlZy+hhoPa7IXE1u+lgv9OrLe+fHHR6RMC879xzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOCF/QFjaEeu2FItrwry1XbScIKhpMoWQBlVyzHIUp/9QY3xXh
	TIkke0nXUAdlUsK+n3/rIquFBzmIXahZ/+E4bBC0JX575XPZzDC7cKgnerJPjqBNlKGeSMqcvtg
	GaVJ5GpVbOe00eshyM14oXbdp7SiXhTGAM+9ULUXO4+LEfvhb85rvRE4gDkxchok=
X-Gm-Gg: AYBFou2gzeg1swxW7hGkCXnfKTIxvTUE05yeAmQBaXnHCqHJf8n9QgB2HqZ4HJFES3k
	lon0ZN/todgP1DJ/Pb90uNBnfily1wb+AlIKGRNN2k1PHJfYGPGS7nE7n0t87BIuxEpPZjBv7zj
	/YkTBwfby5J7TEKIwVgLOJTZsiVBzSlOkphqv2aph3U8hM+lky6cSCTBzK74ReylO7j7vzBOoHi
	YCz2s0NwXN20WPXY7Y9e9UXtEcN4ZXDSKhigNv1Bqvhlf1vsecKdHxIJIIdCAXF7nZds7qIdmtW
	iKdhIvllkC3cLka9V0Wg81dgCpbQWwIpkqxTitZ981HQXCkiCwv2NoOVMj47ASmhP2Gi6NDD3FW
	fTU4GHcw3aXGL5vLWddr4dMC2fd3n69GKbMrLpwlsWMEiz72fh1dq+LWgzf/G5bUpbLHXrDo=
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690394385a.5.1793261737042;
        Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690391385a.5.1793261736641;
        Thu, 29 Oct 2026 01:15:36 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b495ac4a78sm2434202a12.4.2026.10.29.01.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:15:35 -0700 (PDT)
Message-ID: <e67f8b50-f3b0-4a19-bbe3-d1f240ba9b2f@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:15:33 +0100
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
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0oCmfJ3GLLD2MJNhZLQMBWn4l0zF3tSx
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae300a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UmW6FQozgp94pkqAIjUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX22oGH16Q/NbL
 9RaRhtxK9A03RVawc0Ov8e6UVcVNGSh7hMQzM1Sjn0TytQNN4UDnV30Zc+ngrks2vtYxDOWEwnu
 oj/7gyc2pe8AP+Tk2r9dZ7XHzXRIZ0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfXy2aT7Jz30/dU
 s+fceZmyTIPNtq4482StqiiBaB/h5KoOTvljYZs0Ucvmp/m9Hbr42lEhTSwypadrzv/CXHCvO6w
 t8YFJHf/h0QZDC5/DdAtCvVLLoKne4/mgS7jN/es3arP+LEisptBNEnptO16zKRSsMABcUmPftv
 EAsK2U/efLQacIM+8PadpzUnoAbGTzVMR80CJYS1VBjMULYL0zRYa8ysHpPNfl0Z6ZWxbgSgJYv
 FoQs+JNxCjwQX61znQTdJ8hhkc9JKdCjzNsGZf2Ip42eYkle9xYF4Dl1y4cSJXYFJJEsu61a5JL
 Ron/sARUoNpd+MF9A2zyLMEUZSvrO39org3z5of9mIuMWgv4AZUxciOmAdYkCkGAPlhKWv5ZbyX
 bHMvjTTFkTUPa1un8P0EODyhfxzv5ckVjooIgh2izaJmnWvP24Z4pMlWyUUjnQ4fZQyGO+cwaA9
 x20x3KicgaUckxrKJ/Q==
X-Proofpoint-ORIG-GUID: 0oCmfJ3GLLD2MJNhZLQMBWn4l0zF3tSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/26/26 12:29 PM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
