Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199744BCAE
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136450; cv=none; b=Xk3J0tXVf+l0G1i+dwn4DGrnGdJLRIBV5wl9/ig3awa3mO9BQEeZFZ+pOpjtetvPJl6SjptHoqqf43LKqJVy5g2AbsVaAk4N0Lerf49U4Ps4hSNNlfZpq1hFE6Ns6ISiftYl4ZP4Ld1LYYq9Ecwg7zRqS895TjUMeZsNXfPrLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136450; c=relaxed/simple;
	bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g90QeBLlVdQkSX7dparr1JtrsMOCDxe5/7w0fBbkG1md0611QRKVU/IbV1NtgnJaqXL5IOgs4eTGi+SpL2d8TC7cVS533HBHxmlGx+/h3fr0hADxCC3trWwzRoDYpjSrn1zocd8eyUktMyOWZsEI0D9J4p7wTxP1AidHGhr52yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw84kX2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Taew3paG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw84kX2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Taew3paG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8Lht4182028
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 10:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=; b=Iw84kX2TmvvmjdLs
	1F0oqU0yrS/WAieHY1cHYmFOdGOSqSh3qVRb/yRQ5n2YrcpK5CnS8n6QNcTjvspM
	Oxn6GrqBl9XRaV2q+NTwDwcOVQTm9lw4zcU6GAE8qPsqmS3WIeRt3I7oN/IOaks/
	BbqMMPXkI5N7+/DrCTIBxF8m3z/9qvg/fPWr8g4i8jtSVrbJRZfdD9t6tYSzHyoC
	qIhh0x09p3WbLr0rxc7r4zTUl7WJGJncmN3lq+xEILN48zprC4hfxwkswWVp4N1U
	silnBqcKoA9yYgWOu6HiO54Twz0RhdGj3VL/gQqexwNON2nQMukw5yia7h7oMYAT
	uXP5aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkasf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 10:47:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d57d17d6cso1887851cf.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136448; x=1787741248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
        b=Taew3paG/X26iijEfxVHuRGAGlz0qXVXLnuHK5Qh1rVYCns8najF6jeThwtP4c7PMS
         VK9a1RxB8pqC3g2I70esgovUGi84pdNFDiSOyrYR+OkLZlvZMkwmEjqNOcb3kZFMhe//
         eGWG2bbCshOaBE1evZDQGjN20vHBQM1FHam6ZVamMpvSOpJDI62xe2Hz5i4racruka9Y
         LRCATRXZOG7g27b/bRDSTSi9o8M22urUZqzGCeys+kXMBT9BEg2pM3t24sZHq9cZSJgu
         GCgnhO25ekRX5kFlSjF2N5P5eiIufTdmBoPk9VvCz9DQs7P1pL0G05oLnQJbHUknRskN
         9KPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136448; x=1787741248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
        b=G5Dwd6ANVSfovMW6mM79QoOQqcDmoiI36XAmt7Xh8HCxTYp0OjW6foIeniBu1HWzUk
         smk+BzI2QbJdy8in+JumndNytKxcB+K49DpGMJWCFzrRKAh9EyORdY03qKDJPqLRQ37U
         i43qwO21dAD2PRVFegEWCK5sYj+O6iQjENkUR7BHDKaG2H8So0YTan/gW3NQLRoFN/x/
         +pB917Kcm6l9wg0GEyzQ9Sx/qMN1yCn0sFNQyrxtNxkIdtK14wmwbFp3ytxOII/ZCCAX
         UXNADtMks0K8WATJEyXYH3Xu4o6/7vdsyuQ1ii2n/yvNmGZPoG2YoczvCoQRbeRBCd+C
         PXxw==
X-Forwarded-Encrypted: i=1; AHgh+RpjHVexwCmjLg5fNmRRU9QdD4MTKeWy36B1VdZQfYpFui0HbUshT/AFnMdNCVldvNZly/odPlkMIa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0t//KwDtIz5jWYUP2krpXIfTGaViekEetQrHgKfdgeM2Xu4O
	y4SookgBlo29BrtSOxXYnAaMs5ESVCPcjkPePMofcCT/LiRXcfghU9N07sZQZsE/V6qu0ADPUHZ
	VodJVxpICM+N0+eAXbPZ3jOl21nE7c4mEFJqKXEKfTFnNxPKki/dnqkI5gwJ3sMo=
X-Gm-Gg: AR+sD13myoWH9xOzPtheWD70mwxhuxMS02v2HnJb3n8xpazG2sEzDfZDZppKTNdDVDV
	CFGYAYYYR9rI7f0RgIL0ZbubNjOTGKe9Zz+uaCcuWWwkTMha7k7Qp9wC4/1MC3/G7nJptrL/99H
	mU0w4LOP0DNZJnEQUtqsZIPKMusJs61LweOq/PeNV0yzmHcUaDy/NtyqMlnPVTHo4hFziy6Eq6J
	hosEe++wHKK0mxSj2XSvp1+MPrB3tOmkH9aMoRS/JBa4vV1DKbSMUILfv7gZIeggTY1SSfyJ+ww
	J9eyUwza2mgssx7Z1kPwByqijTcJ62CMfwglzjV9QoCYy6Em4GS2Ta06xl8DQhHdF7lqIrNJRba
	3JIbM6lIZvRDOosaR+59GpYDT
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr23786281cf.5.1787136447703;
        Wed, 19 Aug 2026 03:47:27 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr23785981cf.5.1787136447287;
        Wed, 19 Aug 2026 03:47:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1780c9sm658119a12.28.2026.08.19.03.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:47:26 -0700 (PDT)
Message-ID: <3da25205-60d4-46f5-9efe-a97a5a6908f5@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:47:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eV2JmNYQWw9DLkDvU6rFfaCrO2WtvQVC
X-Proofpoint-ORIG-GUID: eV2JmNYQWw9DLkDvU6rFfaCrO2WtvQVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX2pXvmUu3wc3I
 5NzL9BNxesFHutvyBwZOnzQKoj6d7DzXVxRztI7C9P9zbB/f9WA9TqYfP3YrR2P1e2gB5pdEek5
 hFs1SURZWB0sUMtlYOFTwCIIXaj69sgZS8DhSOE+2hr02mMHvzWJzI350yH48nsJUCe94wLwfWk
 +CgeHaDRfbL1PYyGODYuFeRnRp+VyYi4U6LzWOlCaoQ7OwWJlfIHb5eWHgxQSJkHmh+Xs0k48uN
 aN7b6RiUylo9cPIEKZEd9VyPirdSmtAHM6bTgqB7IbgDqLNRbzXOXDGgZQMA0fCi8oWnG/MY0k0
 31DuAM7Sypaw9U17Di7I7yiKSEOzUCjlfKMII5y/m1XWtgVWEI4Ir2ZB/+ptAkbNyNETIN1Kcm7
 TcRovkli6y0SnQDxcIoUYU5m6qp/xJraaamfuNb1F4cWkcRvedc9jJ+85gHCDGGMMnm7QuJcdBm
 flLS/YqxEWarmg0jrqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX/mUJIW9/Vryy
 +m4AakEU7IOj99RhX6V5s+IkNbMLwENA7n/jhIL3qozs7FguUhJrxHLlMDvIqocdRiOH1/yUxsR
 K9+1WvUDUmpaEhIgmnEMdH8J0gQhTDM=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a8589c0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=cfD7LCa2rqpQZjTi_hYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190083

On 7/31/26 9:45 PM, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.

Is the platform-specific, or requires for all rivian PLL instances?

Konrad
