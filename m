Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CD3081A4
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417567; cv=none; b=Ej4vqBl9iiGT/RFsbw6yE3ztskHVixv42cC8ZMZdZI6N0TzjN19PVgwIzEDc6cmbDm7phJ/FBhwaLx9nJTC2WZZG09Yvj/7+1bBwhQSTf7zzKEKpUa06ABV4qVAM4Piv9hQpnOnM2pKaj+ZYjBdCBTyspKYOIuYkbhIVRMpUt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417567; c=relaxed/simple;
	bh=g5NAVgf6eoNLVoTsJ8Xv4qTgMR3Qifxn5DUF2H9j7eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEiviS9Ge7N1lB09tGiqzNZKFR5Wkw0HEhOmqg1jHaINleou92+nHNq+LD89527DpUqnPRBc3SU9fPY30xAhsKuKmRKn50gmiSwZliio1OR2TxvcuS8k0jPz9ExIx//AKn6Vj5JuMa8PKP8yu3E899YpeNjlpbNgF5+wf8AbfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NPxPpgU1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NPxPpgU1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801bc328easo48183135e9.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 00:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417564; x=1770022364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0ZfT4hXcILXw0tTnywFXr8dP4zdAlX+Ff7M5SnOmcE=;
        b=NPxPpgU122grnU52IkL0WVgwrPchIlOY6LKkEiPITmYvyIqNYoiZRnRntnf2zOpciw
         Y6Dblir9CBBK0RoRB/PhjKl7ZBBaRWh/0ImVjV9gl7fkkqN2goRl/izmXKCzdDCd52de
         62fNqP9J96rH4UPLSqTydglsGkDp/9C0wFnGjOiNcRT2G07NZ2v5dkerkvyL/Z/QAiek
         GsI+6YLbfozO7tfzBvaHtQiwUgcuvbpVuD6TVDI0xTye/QL85Pvr7JigzRhhgHrh0B84
         gsNDfQFxqjNxarICdQrxrgU6RTdTGX9H8hRk2SYPjH6IcXrejCYn/mwn4sGtCzUTCZF7
         4rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417564; x=1770022364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0ZfT4hXcILXw0tTnywFXr8dP4zdAlX+Ff7M5SnOmcE=;
        b=dLSU0u/EL0mW5XbQ/p0sc7AW+WUhDpK5p24IE+jr1jy3KzV4tM6Y9x3MAQnPWkbMD2
         /qCf3V4vOR+2/BVB3zaUQm2xyvQtEbbtYug3i1oBco1ZeeGnAdwBZovHWyN9MTe6kq05
         v4cB3piw0YnkN8GqAK0y8NrxSw74IkJCjOrDdjZfQVc7u4tCeyWox6ZKaRwOdJ97N8CC
         JSfO2paNFqJ+BXkaC6/FzIj1V5Dd0/q/F899dhd/Q3pJICTqLGUKjJuIy1yT+CksmIPW
         RC9zxqvTnS2uNDVH+tcEU6UhhSrErcW92OKWar9U7iCkULHVsEnhPQfYqb4WNNdc+YGb
         b0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVRydx5CFjKnyKKSWeU03QJ8KepAweoKSopz3AYQMNZkinmhItE3zl45xqbf7xwIadr/apE1nHHHvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+aHGW4nnXIjBNn1eVCF6UJYsAzRSLkvGH5YP3WpMXVADr0R3
	SimdsbbvRwLUaiX3YkkbXssjxvxRPvofuiStPTOQLD6Ay3rxpLKgMob1pglCtV+WjbI=
X-Gm-Gg: AZuq6aKUGoz6tKOZpt5ap/OTxoNEG2REpdZKcqOIng80I6sO1h9TZXh0PoTTjLg1vQI
	Z0mBWq27vxqZXZeJLRAQb760irdcH5e4FyhMVKrUbXAn/smTaMB/Wnv+TrT8Lp0EIeQ9v1qq4Qa
	4VF1QVpEp+IyEH3AxBpSxHzDcZrnxbV878kn2oCvm6BIyKVEmq1ZfaxY+isaoJROuvnH/HL1AG/
	YYQcoPOtNAZIkUpn+AXbJ6WoUdw7ZLzdiw02nhYsaOB+ygepwcGTsfVBwsKKzlMKebhpV8bUBOa
	k3RV8L7bsnlm0r3xGmWMDZ7fEtxvNV8QMvXTaf0C42fTH119FMRqDibAXCTv/uWYPDcw2FrUEZa
	6oN3HL0xwdMzThZh33BHnmlCYTijoqP8DwBDTCvgXvZUwO9NBZbQwu9wKeKivrHBpJV7EGG0Ael
	iIzt46SODSnpnks5ylVK+KcG16NX42
X-Received: by 2002:a05:600c:1909:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4805cf67512mr68019415e9.23.1769417564125;
        Mon, 26 Jan 2026 00:52:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm102494225e9.0.2026.01.26.00.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:52:43 -0800 (PST)
Message-ID: <15b0d275-1b40-442e-81ae-054ef391ae98@tuxon.dev>
Date: Mon, 26 Jan 2026 10:52:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/31] clk: at91: clk-utmi: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

