Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590292;
	b=kFz9Cpocayvvr4cg5Sl3fcB4VWgyfxBT8E4aHobLgwFgI2d8yJq88Vmccaa1fWqArvV3
	 JeaX38U2qWPZrQxygpRmD4zNe7itYhhJMwKzhWURYIafydKbs2GxOUYGkfNL8wHDbivv3
	 Hxm3j9mupbZ+EdIL2hLjOsfxHnI4DE+UWhqNReG9d0OWrC+S2LK8QFRBqTwPHr9pEyK/S
	 Rvlck0HbxQFa7tTGPJ18FUtrUjLWItLwqFB8hRGYzFfVZwRRIeU3Drd2u6ReRUJJL+vxD
	 1Uah0QHTTV+9U+N+nrX9kyDztJxmKkLKCggojjAW0PHTv3vJbKrG+pGnhcFh7MJ+gqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
	b=pDdQRpq/xazNTSte41K391BA1UEUNjr5kkoND8p6Hf5wplZW+R6IEdrQPPdvOEzTUbvC
	 iPipH+R7/sdBM1H966sCDdbh/A2sL69Z850VrazFGPWKJKpS3TKwbPMGRjiQEo6Nc8/Ut
	 v4ss53IXnyVJeaXSnzWkdHo7WyCMUXT1vo+cGMjjBJ8SXbKmQ6oLQyfz2PXHuv1/dPeB5
	 En11PQpOLn5OPRs0dA77aAUKr7gp6xLcBPsg8tNfVXXhO01djYkGgUIhiApdk2dp2aUQl
	 kprznNy0FmWkXgsxBKZp1AttDDGBfqnMy0d0OzzzrPGJGRvSV8xX/UE5NN1pD03R4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5702606A324
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 03:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5702606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-5187c752f46so1044836b6e.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Nov 2026 19:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590290; x=1794195090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=PuFo8Fq5OxLWNdUrtScWGYp+UfCvRL7Act64x3WJrT45/H7J/Pemv8ulKpTql/UBGO
         xwP72DbZUjIkLYUGJ7Y5x/JJWdT2sx8bR+D2KXp3aaoUMSUes2nnZf7hDCUOcvI727LP
         ZKs5a1m7gO5t+EOprQBmd3rEUAB0vpyAbDF3mf5/VPpxsCRU2QnWl383IXc/q0OH1aF7
         x9pYm/gXj0R8cu76A8+2dsexrpDihysKJ7xgX3lsff5HCyZIxPKVfRE8J5Rb4vJAUu2N
         G/i+nNMpGmkGZmW9IhhY0uB8Bzg4Tfovl1zhneaEx4hVq8Y6brfymv0N6s5+WhkFHkKz
         fa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590290; x=1794195090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=ZDaw5phRpusXN+whSt1Xn9QSmT3aBYKsg/IrWhVsC4bh3ddwCx2QTSaKanOuFsZfY6
         PTvp48G0O9O1ThRPiqwOPUA9qSSXNzTsnD3dQiFB+KVQFmR4Jhb9ZgqNwqRt6GsuyFcW
         YBBNUwO9qvILzRQSP6JZ1flaVMDRXLIEwcZVkK8+MHHzYq7ZkWhx236DIkHPhZ/hQQWj
         BzEvEWYs6570x2HajAKtGMqLzg7lXbOfq6330SghPuEA40sSS5LEUMnTNKW5+9Y/28Cq
         Hf+duJ0S9aJdmbmDj1MRF5LUal6sCZC9tigk/KUN/FiAdfYGg7IUab5qj7rgCp5um4ok
         lHMg==
X-Gm-Message-State: AFq9FYK9aJ1ql8XNPzgHr/etbUif/mzhxN6wY2FUDe4ZPEh5RSuMTQ1M
	SMILL1fvewDFJTEifv2KC1YPci1CiKlZ4rW0AX29gG2cBccYjZMgoJ9q
X-Gm-Gg: AYBFou3ybbn/3bOtg3ZvrKQNFHMEZfVK+BNBxW7ugYZ1My0pu7Qv7NeUYEHa5nySUTy
	ftXX7r2IRr3OuaEmTtDaBopFKmLQUeYtIl5n5vbrmsfiZFX+YCDoB0FKhysWoYJy/m2Q0MINRcD
	al+Ue/Wu0wgWaVLiV5fLx8EBhEqQu8wQtVO+bE7xI5cyMyjwq7QblLkCoF9CVNDyQc90byNlhNZ
	VonTC5ZZBdX9kJXBcqdLidAlj/QPEr2ANIg8kNNvEUjvDqwPFPEHL5VAG5UL6vbz8mLscPIQjKj
	/h398U3OHTAUBJo5yImNuyT257+1HFPMifVBVi5vTUZlHFhXG8MISv9urP2vxH9QA6C+6stvkNZ
	fDUzKs6YIWflWeAHgccNFVmhlxPn4jGpzYSMTqA/NJE/e5aPvviAPllsX8KqUNDh9m/sM7s8yME
	foPNKsUPuHJbGfK9Xjsh+P51Lb0N7lCs4i09oLV8SxqScdi/UcJGkIArpAPhtgi/gwMEb9w6nAz
	/WWtWa6zKxPXrPZSfNExMvfcUOG24ucNUtnmCkBXK81CJnSUwBEPdY/klz0XKq4zJb6QCmrUNmF
	ErOyBh/fM7+DDOt+oo8aCCcOrlQB6vQbbpkOdDS507ecgZF9AgkluiqoOOcAnbfKt4k=
X-Received: by 2002:a05:6808:1a21:b0:4f9:46b9:e80b with SMTP id 5614622812f47-5640d92b74emr5304782b6e.5.1793590289815;
        Sun, 01 Nov 2026 19:31:29 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49923sm6895225b6e.1.2026.11.01.19.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:31:28 -0800 (PST)
Message-ID: <f98c2746-a025-4a13-9e6f-2ed9fa183fad@gmail.com>
Date: Sun, 1 Nov 2026 21:31:27 -0600
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
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
 <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jerome,

On 10/21/26 8:21 AM, Jerome Brunet wrote:
> Hi Ryan,
>
> If you do not see it in the clk-next now, it means we missed it and it
> too late for this cycle, sorry.
No worries! I appreciate the response.

Angelo, since you're sending the MediaTek clk pull requests from this 
cycle on, could you apply this series and the mt8173-mfgtop fix [1] in 
your first one? I checked that both still apply cleanly to -rc1.

[1] 
https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/

Best regards,
Ryan Brue
