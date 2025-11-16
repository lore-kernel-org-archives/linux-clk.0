Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767722756A
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763293156; cv=none; b=UTOLSx8en4JtUbY2nnAF1oIolDBrT2m0uJMzX4Jf6UlbhAqVXVk4MQYMsKvzg1/ehUjIJeuk14S6SB5n9KzfiAxYH+6qvehq3b4CrCLWdbn9ImcB9WGHlCP7+88nTqZ5htV97hBxae3LaFjRkWi12Et5IuTDtuqDZANloTdMTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763293156; c=relaxed/simple;
	bh=cto4Ub/2nyqc9FagqD8NMWlayyDAnzS2+RVFu4RyuQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfBeMQ4En1RxPYVU9PEpKQERMabuSjXdWA2wbcLb3PkG88xsjsF/CMDBjcycsJVb+FgBu+v862YqXMfJFt11yr/WeRlXYT/w9SkhBeoRw8nyK85fT0UCpU+NnUU7Vc3bAbaMfmdSeNjReIZ1TDWUwKk4WYkKnArHs11XwmZWDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBvzxI4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvm6xb9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBvzxI4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvm6xb9k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG5fWYv071899
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p6WIHRv8rfGamZstjZ0Ji7f7
	SCFoQSnIYUIXkBtNh0w=; b=NBvzxI4itPZtUOZz0gkYAw4i9vbOf6UmTiMvjb5X
	yK+LHbZ5XTSM12AzsRl/y817L1Cr667dpNewAtilt8ua+G0s8CY2AKj/XXoZ+LMd
	Q+leIfX5TmCUR2NJ5ohew/VAcUohwI8gqhZ17B9lr2zIHFCleiEEB/XmOAohBmDz
	jufVx4btN6hhJ0K1Dq78T7cnMrBWYH4vi6PAB5HkGJ/9kOCiRFWWLzslKj3/eQAT
	JLSjagilWFuzcuOgQGmCcEtUiHZelqwPHT8PtIikD6pV2nywploz7NqXh21WgKie
	jfosdGHHrXz48xBrGQNkciwBkgmwlJ5nIDr2frlCfzVPBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmyt1bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:39:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed79dd4a47so113089011cf.3
        for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763293152; x=1763897952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6WIHRv8rfGamZstjZ0Ji7f7SCFoQSnIYUIXkBtNh0w=;
        b=Fvm6xb9kK7cx8cgvs34wFzT/XYUgMZUFVrRrj7FExCXGJJaRdZacO0Z+1YApPCLDJ8
         zVikhHYTUNzW9P6JoCqrCTIEnbl7qwqSvYabU08POB21HMSBPl0AsNFgDnOFi6F/26/D
         iUbQKuITTWVWfOupH8DxVb/QDm9W0lnihGTzx3/0smhJyZ8TLwnALpxxoRD0HIo0BmFb
         ix0MHOFWq3kuoVPkSZhuJXG+3G1Z1F1AsaqkxffxpyY3N7w412atg9hS7SfVjAW50dSX
         UkIwsjir8E6IpSRiOd9QkcLn1XZ5VlL8yoP+Z3r0BWM5AeHPx4dCiTiO38MhhyrSoMmv
         1L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293152; x=1763897952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6WIHRv8rfGamZstjZ0Ji7f7SCFoQSnIYUIXkBtNh0w=;
        b=fvfXtyODc/MR/p+0axCjxyJQO7ZH/S8r11Z7pW9nXQbdA7z9yZ3UyMswkGRUaexx77
         y9SFHiZArfXLeZSOJoWimfnjr6uvKL3nnfvtyfr4F0sj3KIXZGBxHlM2RtNKpMOAXK3a
         O/JFjsGjpJBFvZOWi7TB8wgeC+MAFlZQ6XjdSBj0xH5ljF1KkBkffQUx0RZ8xU3OFmHZ
         tATHVuaCUox+WC2X2KlOYpibo/vMgDBJ9Z0DvWNfG1yJb/ATcSTbpp8qOG6LUthMNwkD
         WM6R0ExfuOqVQO17j7T9nU2GzkWs4prCcHOp7iSVKG+rNKx++4+XsGyCW6WMzrJOUil4
         lhFw==
X-Forwarded-Encrypted: i=1; AJvYcCVZX/Fcdah4jqk9/pdc82b9eFWt6j7Ooja9oggMWfnF5JamZkTV64KlBcOMqUirHCYMJa8jcg/S5hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwINfC4pcNKfjo3hXDwJtZBHC68ljL7q6zedN50Py/gjbUrE/ax
	UYQZRV94q7HRhEqLLaZmvxF8j+bZMEg49UFQs/c7n3yD/QaBs9Yrb1xAD6JaMHsQpTqD3fhu+Te
	bwdi/1JEEgmKBLFXALIqqnfXToG6Ic0gn5fW87jJ19og9bIY+Yga4vLM4SCKRUTY=
X-Gm-Gg: ASbGncvYUzqQ5c/aPEaJbgMBFhdKP4KKOupK4kmeKtCBkvqWdYrajqX0jUu2a4YG98x
	1aScx8hGJDgfiyB/U+jaoQZ2PGO/mGWr2Eg546kShXo4JvpIaqQmZ3cF3N/b1nQc7/2jlCiVcqr
	IxztSrpINekjlhMgvpj59e6mp7AgKIQ6DLLC03hj9thPTqteUCJKbunFP2xdI1CMgyigYq1ZWP0
	APKsPLcj0hMk6Ed3doVnsopYG3WSE9ehGNmQ0Zh9AWden2EpYTStaPvFNxbgHKuIIqcBFr8jkkD
	dPCD0xbGGuap33Z+JtfMVFTY3ouCSOMUKwXIQMvYmo9sC6iz1hWm6HwdFIdLLAYVoZ+ohipS4fG
	MLw9R5C5QYYltpz4XJAL9R9AwTxSX+JWXVMpxa3Cm05D7giLBQWj7ZGS7S2kckd3nm4WTx5XM9B
	epC/tjehLz2Rat
X-Received: by 2002:a05:622a:15c1:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4edf212ec7fmr124675711cf.39.1763293152583;
        Sun, 16 Nov 2025 03:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPrMInqhMZ4+KRdgGZhYex78MCfrP1MiAAfpMXp57UExj1gFUHeNmPMlzp3zBUfVDgO+Dt4A==
X-Received: by 2002:a05:622a:15c1:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4edf212ec7fmr124675411cf.39.1763293152157;
        Sun, 16 Nov 2025 03:39:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405688sm2368719e87.77.2025.11.16.03.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:39:11 -0800 (PST)
Date: Sun, 16 Nov 2025 13:39:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing MDSS reset
Message-ID: <x6p3me4zf26y23loq7mvveuoqp6xbqj4nea2wbveghxd7yrh6d@6nkjp56o5z4a>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
 <20251116-sdm660-mdss-reset-v2-3-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-sdm660-mdss-reset-v2-3-6219bec0a97f@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5NyBTYWx0ZWRfXweXgHu9bEQgV
 zlnQDQQDM/OOdoBKJV1H9Oy7WqBTiTkj51N3RAhy3lgRODsb8gGt5LkO47dm4hcx+je3tMQ319P
 BW771dWZq6YZFV5+Z5t9uckKwutN+tv0EsXspGVgA0jU9r1SsSeWdZpNc8piDFP45tanqsYdgtU
 OnBDYNiIq3EkX9i3HXUiD4+ViiGDhrcXt3RSaG06TJtcVsN40VZSrxhyp5ijAPrSIOgsSpKN78v
 bcM/p2AViAaYqofZ48120T8MEtpjQGTBeU8+OJhNW8k16NgJJQf5F33dwfQiZ5rie1iwUHJlQyP
 /ki4DDfWkydhhsUN+EusSEOhUgMHsrE23sZIOvJmx+JIQqVanMhrMxDIsq8WGNKPFcyti4ZIlgV
 2ZVXJdlR7uh/tazgqthyJQ7tXRGzxQ==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=6919b7e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=9sNXwbGNSHJSXmLFv6gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: H7g39hNQtCLUVk02Vbh0r54QaQOonEzf
X-Proofpoint-GUID: H7g39hNQtCLUVk02Vbh0r54QaQOonEzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160097

On Sun, Nov 16, 2025 at 04:12:35AM +0300, Alexey Minnekhanov wrote:
> If the OS does not support recovering the state left by the
> bootloader it needs a way to reset display hardware, so that it can
> start from a clean state. Add a reference to the relevant reset.
> 
> It fixes display init issue appeared in Linux v6.17: without reset
> device boots into black screen and you need to turn display off/on
> to "fix" it. Also sometimes it can boot into solid blue color
> with these messages in kernel log:
> 
>   hw recovery is not complete for ctl:2
>   [drm:dpu_encoder_phys_vid_prepare_for_kickoff:569] [dpu error]enc33
>       intf1 ctl 2 reset failure: -22
>   [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame
>       done timeout
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Cc: <stable@vger.kernel.org> # 6.17
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
