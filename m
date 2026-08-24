Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE63EDAD5
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585017; cv=none; b=LZobUKAgJB1hdXUA5SCOJplN5a87FCVZau2JfIp6WP6una6rsCHmLGjbANC818R8qkP5WtN2rTp+QQV2u3Dk4TiXD9UTPNIL3xiT537QPwENDOK4xIC95BZGFBCIvJ7n0rtBFwQpAxefAsRMUsOKMUxjt+HQiW9pV77i/NJUlK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585017; c=relaxed/simple;
	bh=kEgnCqiPmHxCDrEYEDGEGGryGGddU+96iaj7Q/AZhb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwqikXllS+H3+Q5vNV2ZAXXLNzL0o9hj39w/ntTbEn7mTR7pyG6Cd2VR/q4LtP23bddt5+A0NpCyKDPVyNAvUoOEi0EOGQRDDGcUE6MJ//pKAlHDqo0zS40H/868UqO/hQ/fDj7SShoFOxE9qNWbD/byRkC/VLdmfx4Hd/sTu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=APoGnSDM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOvo7uLL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="APoGnSDM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOvo7uLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
	b=APoGnSDMNWT8igCrQaUfj3EJkeUZJ6iLaWo4v0Sb3PQ1wD37bvR56ZA2iLUDZEgF+rr0ud
	LpsBFZ720Tz2il7v5FolGI4Gg+GycJc/kmGEFRN8TPUJOKQ+1GzlECFiCNfAj60JXyEzuC
	zSqZCorrn7j48N0f77bBVpw83tm0CEo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-QyUZSBmlPJaCBkcmTqaGAQ-1; Mon, 24 Aug 2026 11:23:30 -0400
X-MC-Unique: QyUZSBmlPJaCBkcmTqaGAQ-1
X-Mimecast-MFC-AGG-ID: QyUZSBmlPJaCBkcmTqaGAQ_1787585010
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07f25de2so28743161cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787585010; x=1788189810; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
        b=KOvo7uLLERvOfyVMlsUHfLd8aT3NVAhKpEyHB8Oe26wiofBieqTef7u/TqpEdlBx98
         HGcaiI/wjduNckTPZ+IEahxZtt3XhTJ0T5M2WbJjmMMk0vCO6RRLAJmR8FkKKZXpWJRT
         NjPe4sWIHb2XTu4rc3pfA33761EctRC71VF7NxCndIwTF2qCplOI6tA2lDWR4sq81Yav
         K+ky3d+NL+Eu1gnMSSCXp7+PyFajODCbg1Xyi2S4ayVRj2VkHNmC6S4B2jaoVtqdyIj8
         gptDTe5E/aWdmff+Z9KCsk7TjnsgK9BDgUD2CmMlblsRxJ8sf1FQ93OAuHVznym03CYR
         leuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585010; x=1788189810;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
        b=ofsF73ejk246NpRqG0XQp9kCHIUTbphIKaN5h5WYoZdk6kSARaFF87VezFev68w3QR
         oHLV2AffiOWZNl5jyXB2aTxdbd6qVMSFXUMDBpKCIuMMKNtMvxbyZT17k/2MIXvcCkNq
         /zASLLtjd44Cj76OQyrVnNBwrKGH+fnu7UQiM04NlrEF+SWIjt5Hxz+t9xSkcwFhypl9
         VaIOcSgMzpwI0VKx01+SJuckND89BPxSlswK0XGcJIaW0T4tKWYXnz4wBwv0t8q5c83h
         iz7u4Yf8rsKs+vsQaSuBm2pNUlL0Fc3sBT7FvdkVOJZNuYoYhKBlzBjSnwp81KrBAZh1
         Kqqg==
X-Forwarded-Encrypted: i=1; AHgh+RqctPTZ/Kha3Gyj7VfrKW20LmAl+VStjXRiihnHDAaXCdwX5RN3jGYKPoEIx8zIgJTOmqxij5VeIfU=@vger.kernel.org
X-Gm-Message-State: AFuF++l04ykkndtHmCbbqwH7+edSCC4Yw4LdOPAnrcQzCdV/cxQjOAyn
	0kBevDW5nDRVVy97nHbq7LbkqOArqR1raUBnF8+aZRRHI56mT/jjr6HwibXYTnK4SdWV58UQeDF
	z4sMvktBFs+Jay3q/393mP66Zd25/2MOYiBvJUmRRklyCUJ/6gaMpXn46cR7Ikg==
X-Gm-Gg: AR+sD13s4J9rC/3LnvsAUiiL6OhUyplKgIREwtP7gbUu5o+lh/oFzDB3uIKFwHCQu6L
	IGPiFsMC4DHQOvDmMu1eUAfScSpMarbtXLBCOvfyoU/tqOhF4fL3Abfr0BmAyI7VwbP3ufw/4A9
	52muGWJdvCesos1jiyzw83VB2uHubLCSVz5MfECIU0Kb52QPyiRKODc+SxkNGj4xFcdEU3dOlpR
	/ZIktsyDTtMduBvI/XD+9kPzITVBAhGb4TrAPtWYCsvaYEDfGs7yU4JxzZCJZpTR4j5Sk4A3JDH
	wc7hjRFBg+4ggvAbLa8VDqg6VxuMSviYb1FOHngpXJCW1mnAqn3TQqM4wBOGNyiYlaHiy8ASGMd
	GF1aHoUsRnS1eDRAWS/QpOYybyj9ToetOqcc=
X-Received: by 2002:ac8:7f46:0:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52df5a4a524mr291839041cf.30.1787585009800;
        Mon, 24 Aug 2026 08:23:29 -0700 (PDT)
X-Received: by 2002:ac8:7f46:0:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52df5a4a524mr291838151cf.30.1787585009336;
        Mon, 24 Aug 2026 08:23:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9393202esm65764626d6.27.2026.08.24.08.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:28 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] peci: controller: aspeed: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxh76RQucnlttcA@redhat.com>
References: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:08:05PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

