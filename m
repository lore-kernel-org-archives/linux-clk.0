Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135BA2877F2
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064637; cv=none; b=YTL1AVefp9zf+NGg18NjOqgYZ3QVIKWlVgaXH0/7Phk+NiLRnVgqupU6TaG/XSMyxzvazdO6pZDW1jf7W6L/ZPtHOx+FSJWIaHlzkLcYEzsRxt0qQ6IqUe0S2SB32zNqq7akfszRfNDksAfYWNcgSWWp3DXPdhZNLTsR6su8n7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064637; c=relaxed/simple;
	bh=u9RySDl15q4VQU/CiflITu5aXX26oKXqdEdt/sRfeWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbDGS1qa8Pm4JjeX1OzGU9b5erCSF68fPY7abdABQv1J4SzgVNXRdkIolV0rBkjFPIYvvsScvhmw9py5N3Znrg6izpFwj3XjmFtSvXtB0Oi/FrqZYi38o8MUWrK1r1DZYPvW0yzlThPNc3QafKv/x1zAvc/+YbLBAocs0WdT5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1X4BNp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaz6alS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1X4BNp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaz6alS+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADFQNwp485407
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 20:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8tPGooswgIMKejH3qBxxY3u
	OWCMCTmckngUI1E3HI4=; b=a1X4BNp2ruxrWnEaNCEDX1Wmrw7Lzau2EMdbPhFq
	xGH5rzRHdZYM6/wPCeI0gvPNI0GX4VdEfthT8pY0PcgrW9wttbG0erhMkvw1DqTW
	jjiGbT6UHkWUyGa16j36ujOByRgkCUhPyTQZ02lVMh5tuUkkDfAh/+Nd3HMzhMea
	tmYSVg1Ga4J5gHo+bS3Jz5WeVOoWpVjlliXYWHcgC34Ww1ZksWdjDqsr+WCAYvJ9
	HXSEi9zV6W/HojMwzFBjqrGpUaETlkDd8lA335sRBji7hkS0xL4LH2SqbQhd2feA
	4MKxjmTOJzNAZAGzSOLu4h1ZRKuA/aGWt21qQfPw0a61vQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adhy30w3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 20:10:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso64340331cf.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 12:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064633; x=1763669433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8tPGooswgIMKejH3qBxxY3uOWCMCTmckngUI1E3HI4=;
        b=jaz6alS+1exwY/h+6dYzp55G3wIOWJDhPANBSu2xKR8Y/O8g+jYYOSfwUsHIJrQUUJ
         wfQLTxALR1Gtb+6FOg+hVYA7r0JelfY/EN0ILukh5GkTvSAhAViVLYvUx5aWbshdtMoF
         mq4GZAYGfPRP0HDYpP5EsvsGBhLZOsV/zGUPHqmzUMijiQs8Ai1YVIsUk7qSE3h6bWTz
         9BH7Tf6fMIfP08o4ctdNya0R6Fav1WmPD/MmpuTM+g5+4/8D5VbmecbJn7HRudvxC42n
         BJtBO/qSjXvlCIdbzhU5M1Fe2P0y5jKNTUNVTjcK+FavEIkxd++1vAgXJ+s5dzo9p8f9
         spxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064633; x=1763669433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8tPGooswgIMKejH3qBxxY3uOWCMCTmckngUI1E3HI4=;
        b=VkrwX8HFo/0Zkozl2LjLwdMKD9AJpSEUEsskl81VsE2Clrv7nudaX577aVFP/nOnKm
         6LMBVcUqyZpsYbIJel6Qw/opw3sq8DL37CTbc/k2lMYEL5ZbJpPpIlnGl8SWMuoP+AVM
         vf3pB6WsdH49l8buVLVVvsSkyGQ7vorESIzWcufQ8IAID3l4KuP+1X8dUV+iW+twYfom
         EW2ZoXS8+qi9kqtSgtKu1rAUj35FSO///dJTY3Ymmz6R3YeNvBeVPsyhI8VpjR0u1uPR
         rDegr5WyTGVnlmqTzM5aFm0b/FLqX+5kWDa5B8wdGQWg4bqYdYZHRYDzttfEdhunhTom
         aiDA==
X-Forwarded-Encrypted: i=1; AJvYcCWr/qaFwLPI7e2zpS+JQ/Nez9Pdz7p4dNVop/WMZXQ8/tT3l/Woyn2p/DYP3Tj3uGo6r3GGBjovEQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTUfrlSNbdAq1hOJf57VWJwCNbzIolN8Z2ulot1nRQH2RlFYK
	E2xPBiv+thjOxX/a7rTawlCilH23qcUHkY/nyLfg4n5OMcqjLOv+gjdNf/Uf041WNrGIWZVj5bU
	HJakg1OvdmaektS/3WtYEbjfBKq9nyPrkKgY9VRX3V55XSXrBK2wJUeGYZvND0Aagbp1qaqU=
X-Gm-Gg: ASbGncvckNLem8FEluhxK2mul0ZziGVwGz4IouzknAIesUvGg7WzWyqg19s0XYqym+0
	NelTfZmO7Y14YDaG7He4UcRz9iIxof+1drJCCMcWyfVaYgkOihpnfLMj3yHy3I1yACr9GV4p51Z
	+LmkngEeb61UQ1VhG54O0vAwHNe8K3dxXE/PA00V8NNztn0Akv1AipqkgSUpwKPLtODq/XCQxtP
	rLD4Jbq2Obil6FLxYGjVOlIPvxKVpXRz+V5vEvRgpS/tT1X/5+VX4Jo8AhV+LMg9uuFQ/p3ezNw
	ift5vX2Q+2yKcZpEJ2ZuARoWeX4z0GSIgy3GJQ0q8oCpipf7X1Rdspdd8gzLjMWqzAEHdDaUMdL
	1ibaHZi813evi6xsi4CcJroZXrXcZ7tIc4HbN7oY8asqESlDIv65U9pnY59Tqg/ByGuH9rEThBF
	M+WOXfpHHUBxPt
X-Received: by 2002:ac8:4803:0:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ede706998dmr44418261cf.21.1763064632817;
        Thu, 13 Nov 2025 12:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFopySeu50zsEQ516PeTyLmIBycowUIkiIbbJG3BWLcacYVYWdgBnMHXUAf/J7cPwjPRWvs9w==
X-Received: by 2002:ac8:4803:0:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ede706998dmr44417871cf.21.1763064632299;
        Thu, 13 Nov 2025 12:10:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803aca8fsm598424e87.9.2025.11.13.12.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:10:31 -0800 (PST)
Date: Thu, 13 Nov 2025 22:10:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: remove unused 'apss_clk'
 structure
Message-ID: <sqdj3tn2zno4xbdywrijdnnqenlxlmb6wowecxfapzilzy7z6o@yiwqvg24iofy>
References: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
X-Proofpoint-GUID: ROLANOuwGTj9eiMc2RFOo8NNCYiIn4rV
X-Proofpoint-ORIG-GUID: ROLANOuwGTj9eiMc2RFOo8NNCYiIn4rV
X-Authority-Analysis: v=2.4 cv=JuT8bc4C c=1 sm=1 tr=0 ts=69163b3a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=55GwOStj87rXbfvUp68A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NyBTYWx0ZWRfX+uF4WPZxVRSM
 9tnFCSMhEtSrCmDx7FFkuQ13mBWSGBn8rgAU9gIXX6IZ3yi3KaKCTcRWob00ZztXgkmmoBa6pkO
 I6E+Tgna9AiAu3TK9TPMezJ61DQpXfwQAFQFL+8/Iu0b2iqdQJ7F+LjnesDKOb9x66BcKmpSIP/
 odBmHyROMMnw541+zwBNSQeM4XsoPk09qJ8ZJki8NF8iqLMaupTXQAXHZx+cB65ktsP2+eQJ1lJ
 jXzvPipJNwp8nStPeninsajeoUsSj+IY2SmRCvZ4DymEK5N4nELqkzGuekMCcWXTqlk0y5+32YJ
 6ROpkDUvZHhQ7f/aSqr4miJxn/AgKJUL8+7AesK6HrRbeucxtk7nFscjFubuuXfAt8ZWbOM9b+7
 c1Tsg4sU3g+EcKl0UmVF8lSLDAARow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130157

On Thu, Nov 13, 2025 at 05:15:25PM +0100, Gabor Juhos wrote:
> The locally defined 'apss_clk' structure is not used in the code, so
> remove that.
> 
> Compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq5424.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
