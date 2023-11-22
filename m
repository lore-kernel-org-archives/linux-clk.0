Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmMPxghl"
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331CE1BD
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 12:22:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50970c2115eso156241e87.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700684556; x=1701289356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7MrYgOMdKVuK+GDXv9aJD8jhLhCPuIE63O1Ov1GqRc=;
        b=vmMPxghlI18mS/HMiHX2JHnysNomTrXCWD0zL3LTi0eSq2b/lTUElj9ULvI00QbgVJ
         vLm+tWwWATGL6kCqJeAF0vBZ6kITuaPGbr6qlPZIUiFuQJxiIS5iVsUrm3Prp5starms
         I9T2bTWkLWi4ok/RGTZFCk4sLxZdEJJI98Rf/GTF9K+IA6MD84d04PuZyritLLOzm/9k
         JSUJyrrw0wJTDbpKHLwcKAi+NlURaN3YuJXsQqWWJPk7iiCuV5O4vrb/fHCuu9VAlYUu
         F+Hxa1QMOujHRByhH7SGjsn093x/Q7dSHcFsp0nYcsYKDiAw6gVDQr76KiaUIUWqFZum
         RujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700684556; x=1701289356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7MrYgOMdKVuK+GDXv9aJD8jhLhCPuIE63O1Ov1GqRc=;
        b=idh9IiwOMI/JpKi6gJOvTxZTOYTKdLN0YohP5GEN5TN2PVX4UkbGauHDOL7HnE0iOr
         xJ4u0uIg/gbSscxurs06ZzPpPbO91vtBS8IPmZt8XroMNl8Jb6Nx+2pAMmCEHtjxV51S
         5tu9SUkauGgjGsymaO2du39HyQZE8XRX/6Ge3Sb8O/9kEEG5D3CE869Yiwpee8ztI6u7
         tCTejea6/vT3FmYrJcXH6pJGTb4/9cU2Tdvus7vhH9bRNozRDGndSrgWXX/ZNUIumoP/
         EEduYxyZIdObyzA6ItDtBcp5/1vuPf34b1g6ZOJi1yGZhjD7Tc9BR8mT6zxpZUdVqKD3
         SRfA==
X-Gm-Message-State: AOJu0YyrbbVXtaLRuvnZqnC8y7Grf8MIb+u18vLqVujyC+CkdJUgEDRU
	DeipqzmyFCaHPoHOqChxDKxOfuG0XODJ561ASHByEc+v
X-Google-Smtp-Source: AGHT+IEhleik4LWRMe/dmf9VTpFWeI3uN5MuNWVtzwF5hLzAKGpAJN5yXMeSzO52dXBTv06mOretFA==
X-Received: by 2002:a05:6512:3c95:b0:50a:a5ab:e393 with SMTP id h21-20020a0565123c9500b0050aa5abe393mr3366084lfv.61.1700684556447;
        Wed, 22 Nov 2023 12:22:36 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d24-20020a056512369800b005091314185asm1952576lfs.285.2023.11.22.12.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:22:36 -0800 (PST)
Message-ID: <81a8faea-b2d3-437d-8923-954569969bf6@linaro.org>
Date: Wed, 22 Nov 2023 21:22:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] clk: qcom: ipq5332: add gpll0_out_aux clock
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-5-a7ff61beab72@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121-ipq5332-nsscc-v2-5-a7ff61beab72@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 15:30, Kathiravan Thirumoorthy wrote:
> Add support for gpll0_out_aux clock which acts as the parent for
> certain networking subsystem (NSS) clocks.
> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
