Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213461353FE
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878066; cv=none; b=bMNABxvoXNhR4CNuC8zwAwRro84F88mlrp4xLcAq+cK9NKOnySc2HUxC5jkRHBogJCe4gUReO6xv8/QNbfCHuzfPsvfi2pKdloTxRs/ICz4L31xNtHz587OyeJr2R1PnAYTYgdUGHM8IeQN7QeBb5LTaEv1qRzzkDEt2rSguhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878066; c=relaxed/simple;
	bh=3ALgL8+QCMpbphZi9jDeommUnpU+m1JOIjWutRJPBnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiCcBqTnm2jIgtQYIP+sEkSHcwREG42ttSpOxqvtcbltbXFIZRnTe6BRkuiF8yTe3gvWNhRfJPJauSSZVRND/vlDzOVgxDP5DEvpEDw6bL0lX+R6WCpgqY2Vfn8H1JvExhOu52IZLw6oqCZ87ZDvJ6rUH8wAGCwPnRhudk+WH/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g40wE88u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g40wE88u"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d872102372so50218541fa.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878063; x=1714482863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NY8T4CeaWeTNiGVIpd/ngSSzwEcWRKriqXE44ze7nRQ=;
        b=g40wE88uQxY0l4tLCWxot1MkG3HUzaH2E14UQDggtk5ZH7fI4QJb5c7cWAnMZDwvxV
         64NtYyCRhpIUMAZ4NdQvd5SOEJNyQ5NbHFjk6idOe43CL5r6/pmaWkaMTyn8U6pfE5en
         O+lmvKGATqso2lkkqrQktxbTol2X2DD9np7e2c9MBaMBBihgaM2hiW2+LiK6ayLPu78N
         eeutCVc1dH8dYxF+9TvJqt/Q4y7k3EtLC+zK6U567iI6p8l5/jA/E4fDh9jRrGMFKyYA
         lM/2U7CwZj74n5eX5NaxTBMBlfJVoiV6fD9OC+COxehw0RpH5ik8Npm1SMp+7yc5Cfic
         YHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878063; x=1714482863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NY8T4CeaWeTNiGVIpd/ngSSzwEcWRKriqXE44ze7nRQ=;
        b=nAgoMa3xkrC3PEfty0cMa3ku3ItAwAHrffflszQ3TEP3bxkRKhQ6OISJdZHdeYPmu0
         N/5Araa2r/2eDyL9wOOC7f6ae9ikfJ/YfGyUBqCTpwEqyUF2RE5ygmW12ZKiUqf767Bh
         KS8IJjqEo4QV0n5112bp3pRs+GZE0oVUS1dTtm18d+TnQt5zx1tKxiXXigXA9/rk50DU
         oRG3drqJbswWVmZG/kEXFl8fqkGrP5K4tcI+61ADBeG5TPt7iE/uF5bwI9olX0HihZUi
         R+5F+f1PtSyyB4bR6qr2X3Oq40KjU1sWrRl4ZbXfy80bZvfCzgfTOXhHyrQ3F342l1lr
         iZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVteqjcfqIzjTebjTFF1LT8VGpdC4hoofny5OUGpKBE6MbRk5SdRSa8Y1SeAd4h7t4uYXSkoZ9mDPQTx7tBuU6VzAfkXJS9Ag5y
X-Gm-Message-State: AOJu0YwhCDnjRbzgQdrCN2/cqzYDJSYk7wm3mV7IcKx9rgd/5L40Jigw
	SqF3XMO7J9nry4bedIAVzOFVFKwDRzV6A7wnU/N5V9ZmaoBeNNVichV8wYmRbeA=
X-Google-Smtp-Source: AGHT+IEApX48gy5u+zDNEfRdmXEQyc0oJRptbKDpcZL1/iM0xpsXEJqtJwc/oKoRbmR3KY6hSGXJlg==
X-Received: by 2002:a05:651c:215:b0:2da:6f95:2826 with SMTP id y21-20020a05651c021500b002da6f952826mr939409ljn.9.1713878063336;
        Tue, 23 Apr 2024 06:14:23 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w17-20020a2e9bd1000000b002d8e42c1b5fsm1732618ljj.42.2024.04.23.06.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:14:22 -0700 (PDT)
Message-ID: <9adac76c-a1cd-459c-a5e5-5f3daad6a6ff@linaro.org>
Date: Tue, 23 Apr 2024 15:14:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] clk: qcom: gcc-sc7280: Update force mem core bit
 for UFS ICE clock
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-6-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240318053555.20405-6-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/18/24 06:35, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock to force the core on signal
> to remain active during halt state of the clk.
> 
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")

You describe the solution, but not the problem. Please state why it's
necessary to do so.

Konrad
