Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3A330D2A
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577638; cv=none; b=ZmrE746TphzP2X4HeRHmFs8od5mf62lCZOKOFKXNVR7rp4fssiQcdrbpZE+EPNALpIPuftronQnrhxoEY9zPRfjmrLuHnpbtWBDTn8midppeVOuvX1RsHC8Vn9JV2hDdws48sIlsEQWdKNgzQW88DZp7wlTzG6Spl16jq06Yrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577638; c=relaxed/simple;
	bh=unLxEe9LSSVmcXoHihpmUinadoH4l9P6EpdzeKBfsgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s74N8LEJPlgB1xRcPHwyoHZpEU6ydvoDU8xG6bP+GeQsWlaekY2JhMI4rduzfTs234nrxH1bXydyrn7rsnI8lRDQ2WXTcLAMwq1NQR5zKBSfST5z5ENAKZS6ChH3RMLEdx5DB5aShFcBS/UN8wpzMgN0b3KTIu5oFnZw5I3vq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmcoISyt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zr8cteGu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmcoISyt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zr8cteGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784577635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
	b=JmcoISytZTtNtQmazi7DnEXva8r4dkh48r/xrzKEPCQfpvX2FJIok3CeCNPByaKyxwwZMR
	Sl5N5kfNM8g/iPmjqtRHn3MeVEj1XByQf+Qrk9eMS9lcLRzCaOLR3rK9/1t3i2f4s55fT+
	HTdn9dy1A8xQEOCx54GlCWEr91TFDZo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632--LLoEH8QPSi9yi6gIdUPqA-1; Mon, 20 Jul 2026 16:00:34 -0400
X-MC-Unique: -LLoEH8QPSi9yi6gIdUPqA-1
X-Mimecast-MFC-AGG-ID: -LLoEH8QPSi9yi6gIdUPqA_1784577634
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1852a86fso151121711cf.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784577634; x=1785182434; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
        b=Zr8cteGuwIQBjMvMvi3idHAkP4GRL5HteADrLnqZzjab+OCfEtHpYguaUTJUMPC1E7
         d1kCJgIteDEqcoTw5mhA/7tTwElt0aIbtDUVF9NFFU8nfW4JrHMQ+kwf/rR0zslK1HKy
         7bnjhupewLFet1tGEtnQlWe3ZkhuokxdthOociKDJMXcVChw/j5RxP/XmjBlJOPAm5FO
         LxFyP5hWibjNKPvQGOpdsCYYveU5wNCH6Bo6lgdb3rzODpkuOF1MhH+Bn4v4bRrCfkA5
         3Cc+L+1Covt4N57Z0+3hkaZLFMJ6KjWxDjYuW9t3CgEaUF0KXfz8rtyIRkwQAw5NnZQ6
         JJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577634; x=1785182434;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
        b=oJPGUflYTY1NmHg2/I1uX1iLanumo/v0pU2FBnxY8WDhJVw5yAcZmhJurClQZdCsbN
         6Hm9ImpHl/oKu2PYgKLae3nq+lOBHATrw3enrkmEE+irTggrIJH2g4G4Tlcu/VGMHNX+
         T7k66u1HG/oxWcsP6vrIDWvrlNH8z8ULUULmdddh8COaOHiEyveRoFIjYTggbiaLQIic
         Frgd8STTSmiGjWhhng8x1+OzHLwqDOiX/9+wT8dLd0YpgwCZDCvnALZ22hRmE7odjTWH
         ObNkYoPcDqV0o8rhFe1hPuMq0uS8t2KYzpwBRjxSRkvuT+hRRrGIBdMsfmqRvw+iGR5/
         QlKQ==
X-Gm-Message-State: AOJu0YxUbZcgInEthpvuuUjT4l/dxtMBRxj6qeaaxqj82Ix7zTe8o/N1
	vLFMk+tbCS9VzO7Lx3Z5CxqU7PXhZ+KPaCYtR51wgMTcY/r1GwCItfhAIka6Xy8rkF23hWSXexy
	2EK+ZcOl0FKZ0sPrVhNV/h4aE2cspuLbQZ3xDQxYseUaGC8eoTwx718a+d21AcA==
X-Gm-Gg: AfdE7ckpEYYY3QgeI0O1XzMeDcnPHaa4xN9HDXJftQsmWE5X+sMnYLPWZl1RZI82vPa
	Eq+pD39L3dQYbWY0mfEWtoBsEhb3D0z8UCRQvSOWelW1i8TNlBFO1Nn5sTrW+U16Q5kZIlpcL75
	qRMFRhiMtzvSMaUzBC4Tm4+HarlLTrs7lcFxuQ2Km2WgoXYp9ZCuI0keTedWq5cqNgZYYlVKKp9
	Ns8tpttZvYqudNZzmspyTIawFC48Xl7mxoWAu91ubOREZb6IZ/Dtl6MG8XGO/GKWWzszeDlF1wZ
	CVHhCQlMeno5Oxm/HqW9HiSKEekqLsDXaF6Fyxa63jDedk/21Tev3AvREgFRc1caqFffcbPHRkm
	CNOFAToo9eqvtpyGYiuJPokpRxQG4WF9KNIA=
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr144964651cf.25.1784577633567;
        Mon, 20 Jul 2026 13:00:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr144963511cf.25.1784577632627;
        Mon, 20 Jul 2026 13:00:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f5fb88esm81796841cf.21.2026.07.20.13.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:00:32 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:00:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 1/2] clk: stm32: add missing bitfield.h header
Message-ID: <al5-XWhDkr2to7qt@redhat.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
 <20260719215040.767232-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719215040.767232-2-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Jul 19, 2026 at 02:50:39PM -0700, Rosen Penev wrote:
> It seems some ARM header includes this and the build passes there, but
> nowhere else. Note that the driver has COMPILE_TEST in depends.
> 
> Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

